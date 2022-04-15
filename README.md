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

procyon-registryctl publish hey/hey.wasm hey 0.0.0
procyon-registryctl publish hey-next/hey-next.wasm hey 0.0.1
procyon-registryctl publish hey-last/hey-last.wasm hey 0.0.2
```

## Deploy the Runnable
```bash
procyonctl task deploy hello.0.0.0.wasm hello rev1

procyonctl task deploy hey.0.0.0.wasm hey 🔵
procyonctl task deploy hey.0.0.1.wasm hey 🟢
procyonctl task deploy hey.0.0.2.wasm hey 🟠
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

```bash
# call hello function
procyonctl func get hey # it will return nothing
procyonctl func get-revision hey 🔵 # it will return `<h1>Hey People 😃</h1>`
procyonctl func get-revision hey 🟢 # it will return `<h1>Hey People 🎃</h1>`

procyonctl task set-default-revision hey 🔵 on
procyonctl func get hey # it will return `<h1>Hey People 😃</h1>`
procyonctl task set-default-revision hey 🟢 on
procyonctl func get hey # it will return `<h1>Hey People 🎃</h1>`
procyonctl task set-default-revision hey 🔵 on
procyonctl task set-default-revision hey 🟠 on
```

