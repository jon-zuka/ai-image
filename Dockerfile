FROM ghcr.io/astral-sh/uv:debian
WORKDIR /root/workdir
ENV VIRTUAL_ENV=/opt/venv
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

RUN --mount=type=cache,target=/var/cache/apt \
    --mount=type=cache,target=/var/lib/apt/lists \
    apt-get update && apt-get install -y \
      nodejs \
      sqlite3 \
      libsqlite3-mod-spatialite \
      spatialite-bin \
      libxfixes3 \
      libxext6 \
      libxrender1 \
      libx11-6 \
      libglib2.0-0 \
      libxkbcommon0 \
      libxi6 \
      libgl1 \
      gdal-bin \
      libgdal-dev \
      v4l-utils \
      ffmpeg


COPY requirements.txt .python-version ./

RUN --mount=type=cache,target=/root/.cache/uv \
  uv venv $VIRTUAL_ENV && \
  uv pip install --requirements requirements.txt

CMD [ \
  "jupyter-lab", \
  "--allow-root", \
  "--ip=0.0.0.0", \
  "--NotebookApp.token=", \
  "--FileContentsManager.delete_to_trash=False", \
  "--no-browser", \
  "--port=8888", \
  "--ServerApp.allow_remote_access=True", \
  "--ServerApp.allow_origin=*", \
  "--ServerApp.trust_xheaders=True" \
]