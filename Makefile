all: compile

###===================================================================
### build
###===================================================================
.PHONY: deps.get get.deps co compile run clean clean.deps clean.all shell release deploy

## 获取依赖
deps.get: get.deps
get.deps:
	mix deps.get

## 编译
co:compile
compile:
	mix compile

run:
	iex -S mix phx.server

## 清除
clean:
	mix clean

## 清除deps
clean.deps:
	mix clean --deps

## 全部清除
clean.all:
	mix clean --all --deps

## eshell 窗口
shell:
	iex -S mix

release:
	MIX_ENV=prod mix release --overwrite --force

deploy:
	mix phx.digest
	MIX_ENV=prod mix release --overwrite --force
	cp rel/bootstrap _build/prod/rel/ex_fc/
	cp rel/libtinfo.so.6 _build/prod/rel/ex_fc/
	cd _build/prod/rel/ex_fc/ && \
	chmod a+x releases/0.1.0/env.sh && \
	chmod a+x releases/0.1.0/elixir && \
	chmod a+x releases/0.1.0/iex && \
	chmod a+x erts-11.1.7/bin/erl && \
	chmod a+x bin/ex_fc
	fun deploy -y
