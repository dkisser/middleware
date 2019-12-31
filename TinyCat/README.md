# TinyCat

### 快速搭建数据交换服务器
#### 前言

> 随着业务开展，系统不可避免的需要与第三方系统进行交互。交互方式常见的为Http和TCP。不过大多数场景下均是
使用的http协议来进行数据交互。但传统的Http服务器如Tomcat等有其他额外的功能，比如页面渲染，session控制
等相对来说不太重要的功能。对与对接人员来说我们应该关心的是如何与三方按照格式交换数据，而不是关注如何创建
一个简易的web服务。通过TinyCat可以快速搭建这样的服务器，功能简便。其设计采用微内核+富插件，平等对待外部
扩展插件与内置插件。

#### 功能清单
* http数据交换服务器
> TinyCat目前支持两种内核，分别是tomcat与jetty。默认采用jetty，这里也是推荐采用默认配置，毕竟我们
需要的只是一个数据交换服务器，并不需要其他太多的功能。

* tcp数据交换服务器
> 使用TCP来交换数据需要考虑到半包和粘包的问题。目前常用的解决办法分别是按特殊字符分割、根据固定长度
报文头来解析等。考虑到采用特殊字符分割时，特殊字符常常是无法打印出来的字符，这样对客户端开发人员来
说不太好设置配置文件。而采用固定报文头来解析时，报文头的解析方法需要客户端开发人员去自行实现，这样
对客户端开发人员来说也是一种负担。再者，对于服务端来说TCP交互也分长连接和短链接的区别。同时由于
TCP服务器内核的性能对其影响至关重要，我们需要更深层次的抽象来屏蔽内核的差异。所以目前暂时没有TCP
服务器的实现。该功能会在后续更新

#### 快速使用

> 大量采用SPI+模板方法的设计来实现功能的可拔插，以及对自定义功能的扩展支持。由于TinyCat主要用来作
为数据交互接口服务器。所以客户端人员需要自行实现HttpHandler来完成与第三方的数据交换。同时需要将自
己实现的HttpHandler绑定到配置文件中。TinyCat默认有两个配置文件，一个用于配置服务启动的端口与自定
义HttpHandler的绑定关系，另一个便是用来配置TinyCat内核参数的配置文件。其中绑定关系配置文件是必不
可少的，少了它整个TinyCat将失去存在意义。内核配置文件反而是缺省的，因为采用默认配置也可以启动数据
交换服务，但是若是想使用自定义的内核，那么这个文件就至关重要了。因为采用何种内核也是可以配置的，若
是你了解TinyCat可扩展机制，完全可以使用自定义内核。

#### 目前缺陷

* 内置Tomcat内核在停止时会挂起部分线程导致程序停不掉
> 在使用Tomcat内核时，若是手动调用BootStrapMain.stop去停止服务器会得到服务器警告，且线程会挂起
此时服务已经停止，但是仍有部分线程被Hang住，但是由于目前启停脚本基本会有超时设置，超时会调用强制停
止进程所以影响不大

* 暂无TCP数据接入服务
> 由于TCP的"高度自由"，所以需要更深层次的抽象。这个会在后续版本中更新，敬请期待。

* HttpHandler封装层次较低
> 目前HttpHandler拥有两个参数，分别是HttpServletRequest与HttpServletResponse,在获取请求报
文时需要手动去的从ServletInputStream中获取报文。不过这样设计也是考虑到部分场景下可能会通过这个
服务器去传输文件，所以没有进行深层次的封装。同时相应报文时也需要先获得ServletOutPutStream来写
入响应报文。不过也有好处，你也可以通过响应来返回文件给请求方。

* Http可设置参数较少
> 目前支持的http调优参数较少，只能设置maxThreads、SessionTimeOut、maxConnections。
（jetty不支持设置maxConnections）

#### 内置模块

###### 服务的启动流程大致为两步，第一步为绑定关系配置文件的解析，第二步会根据配置文件按照协议来"暴露"服务

* Protocol
> Protocol用于抽象不同协议的服务器的共性，例如export()、unexport()等。在解析完绑定关系配置文件后，会
生成ServerModule(服务模型)，然后会根据ServerModule中的协议模型生成相关的协议模型Protocol，接着便会
去调用具体协议模型的export方法

* Resource
> Resource指的时模块，其中包括三个接口分别是Resource、ResourceLoader、Reader。我们知道常见的文件定
位有ClassPath、File等，这里抽象的目的是便于后续支持更多的文件定位。相关设计可参考spring的Resource等
的设计

#### 模块扩展

* Resource
> 已有 ClassPathResource
> 用于定位资源。未来还会有FileSystemResource、URLResource
* ResourceLoader
> 已有 ClassPathResourceLoader
> 用于加载资源。未来还会有FileSystemResourceLoader、URLResourceLoader
* Reader
> 已有 XmlReader
> 用于读取ResourceLoader并通过调用Parser来解析绑定关系配置文件。未来还会有propertiesReader、YmlReader
* Parser
> 已有 DomXmlParser
> 用于解析绑定关系配置文件，并通过抽象Parser,可支持多种解析方式。未来还会有propertiesPrser、YmlParser
* Protocol
> 已有 HttpProtocol、TcpProtocol(不可用)
> 用于解耦协议，通过export、unexport分别启动/停止单个数据接入服务
* HttpBinder
> 已有 JettyHttpBinder、TomcatHttpBinder
> 用于解耦HttpServer的内部差异。想要实现自定义http服务只需要实现HttpBinder及相关HttpServer接口即可
* HttpServer
> 已有JettyHttpServer、TomcatHttpServer
> 具体的HttpServer的启动与停止在这里实现

##### Update Comment:

*支持快速Http方式接入，可通过傻瓜式配置自由切换http内核(jetty、tomcat) --2019/12/31