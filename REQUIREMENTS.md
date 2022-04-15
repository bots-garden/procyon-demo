# Requirements

🚧 wip


```
brew tap suborbital/subo
brew install subo


ℹ️  building single Runnable (run from project root to create bundle)
⏩ START: building runnable: hey (tinygo)
go mod tidy: error loading go 1.16 module graph: github.com/suborbital/reactr@v0.15.1 requires
        github.com/bytecodealliance/wasmtime-go@v0.35.0: Get "https://proxy.golang.org/github.com/bytecodealliance/wasmtime-go/@v/v0.35.0.mod": net/http: TLS handshake timeout

If reproducibility with go 1.16 is not needed:
        go mod tidy -compat=1.17
For other options, see:
        https://golang.org/doc/modules/pruning
Error: failed to BuildWithToolchain: 🚫 failed to build hey: failed to RunInDir: failed to Run command: exit status 1
```