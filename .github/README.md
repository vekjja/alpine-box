Alpine Box
=================
Alpine Box is a lightweight, secure, and efficient container image based on Alpine Linux. It is designed to provide a minimal environment for running applications with a focus on security and performance.

Features
-----------------
- **Lightweight**: Minimal base image size for faster deployments.
- **Secure**: Built with security in mind, reducing the attack surface.
- **Efficient**: Optimized for performance with essential tools and libraries.
- **Customizable**: Easily extendable to suit specific application needs.
- **Multi-Architecture Support**: Compatible with various architectures including x86_64, ARM, and more.
- **Open Source**: Fully open source, allowing for community contributions and transparency.
Usage
-----------------
Docker

```bash
docker run --name alpine-box -it --rm ghcr.io/vekjja/alpine-box:main
```

Kubernetes

```bash
kubectl run alpine-box --image=ghcr.io/vekjja/alpine-box:main --restart=Never --image-pull-policy=Always -it --rm
```