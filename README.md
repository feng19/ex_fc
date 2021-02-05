# ExFc

使用 阿里云 [函数计算](https://help.aliyun.com/product/50980.html) 部署 `Phoenix` 示例记录

- 使用 `phx.new` 创建最简洁项目
- 设置 `port: 9000, server: true` for `prod.exs`
- 从 [docker-erlang](https://github.com/erlang/docker-erlang-otp/blob/6535df7fd98bcfaab3539fd2a374c667f37a2834/23/slim/Dockerfile) / 
  [docker-elixir](https://github.com/erlef/docker-elixir/blob/596458698bd8febec1ce35aca04e86e22b0aa2c7/1.11/slim/Dockerfile) 
  的容器中复制 `Debian` 环境下的 `erlang` 包
- 因为 `erlang` 运行依赖 `libtinfo6` 包, 但 [custom](https://github.com/aliyun/fc-docker/blob/master/custom/run/Dockerfile) 
  中并没有，因此直接从 `docker-erlang` 的容器里面拷贝了出来，亦可通过 `rel/fun.yml` 来安装依赖包
- 配置 `fun config` 请先阅读函数计算相关[文档](https://github.com/alibaba/funcraft/blob/master/docs/specs/2018-04-03-zh-cn.md) ，并完成配置: `template.yml`
- 注意如果开启了日志，需要将 `服务配置` - `日志` - `开启请求级别指标` 中的开关关闭，不然部署会报错
- 不配置也可以访问，但是并不能浏览，只能下载网页，配置自定义域名之后才可访问，如需不需 `https` 可以删掉证书配置
- 运行一键部署命令: `make deploy`
- 访问自定义域名即可: [fc.feng19.com](https://fc.feng19.com)
