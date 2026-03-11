# ai-image

A Dockerized JupyterLab environment pre-configured for AI and computer vision research.

## Getting Started

Pull the pre-built image from GitHub Container Registry:

```bash
docker pull ghcr.io/jon-zuka/ai-image:<tag>
docker run -p 8888:8888 -v $(pwd):/root/workdir ghcr.io/jon-zuka/ai-image:<tag>
```

Then open [http://localhost:8888](http://localhost:8888).

### GPU support

```bash
docker run --gpus all -p 8888:8888 -v $(pwd):/root/workdir ghcr.io/jon-zuka/ai-image:<tag>
```

### Build locally
a
```bash
git clone https://github.com/jon-zuka/ai-image.git
cd ai-image
docker build -t ai-image .
```