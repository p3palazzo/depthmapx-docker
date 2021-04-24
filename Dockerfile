FROM alpine:3.12 AS depthmapX-builder
WORKDIR /work
ARG version=0.8.0
ARG url="https://github.com/SpaceGroupUCL/depthmapX/archive/refs/tags/v${version}.tar.gz"
ARG tarball="v${version}.tar.gz"

RUN apk --no-cache add \
        bash \
        binutils \
        clang \
        cmake \
        g++ \
        gcc \
        glu-dev \
        make \
        musl-dev \
        qt5-qtbase-dev \
        wget

RUN wget ${url} && \
    tar -xzf ${tarball} && \
    cd depthmapX-${version} && \
    mkdir build && \
    cd build && \
    cmake .. && \
    make && \
    cp depthmapXcli/depthmapXcli /usr/local/bin/

FROM alpine:3.12

COPY --from=depthmapX-builder \
      /usr/local/bin/depthmapXcli \
      /usr/local/bin/

RUN apk --no-cache add \
        g++ \
        gcc

WORKDIR /data

ENTRYPOINT ["/usr/local/bin/depthmapXcli"]
