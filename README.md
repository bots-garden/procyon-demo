# What is Procyon?

🚧 wip

## How to create a Runnable

👀 this blog post: https://www.wasm.builders/k33g_org/fight-complexity-of-webassembly-with-reactr-222k

## How to publish a Runnable on https://wapm.io/

👀 this blog post: https://www.wasm.builders/k33g_org/publish-your-runnables-on-wapmio-49k0


## Create a Runnable
```bash
subo create runnable hello
```

## Publish the Runnable to the local registry
```bash
procyon-registryctl publish hello/hello.wasm hello 0.0.0
```

## Deploy the Runnable
```bash
procyonctl task deploy hello.0.0.0.wasm hello rev1
```

## Query the Runnable [`POST`]

```bash
# call hello function
procyonctl func post hello 'Jane' # it will return nothing
procyonctl func post-revision hello rev1 'Jane' # it will return `hello Jane`

procyonctl task set-default-revision hello rev1 on
procyonctl func post hello 'Jane' # it will return `hello Jane`
```

## Query the Runnable [`GET`]

