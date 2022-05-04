# kubectl service

Containerized `kubectl` service.   Mount a Yaml Config object for outside K8s use.  
Use `KUBECONFIG` environment variable to specify the path to the Config object.
By default, runs `kubectl proxy`.

Runit will create a management directory in `/etc/service/kubectl/supervise` containing
the following files:

```
supervise/
├── control
├── lock
├── ok
├── pid
├── stat
└── status
```

See http://smarden.org/runit/ for details of the various files provided by runit.

The `pid` file can be used to signal a restart of `kubectl proxy` process.

Arguments can be specified with the regular `args` construct.

If interprocess communication is required, mount an emptyDir onto
`/etc/service/kubectl/supervise`.

# Docker Hub

Prebuilt container images available at Docker Hub:

https://hub.docker.com/r/morecontainers/kubectl-runit

# Author(s)

* Henrik Holst <henrik.holst@outlook.com>
