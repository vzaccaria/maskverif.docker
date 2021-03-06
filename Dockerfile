
FROM ocaml/opam2:4.07

ENV SCVHOME="/home/opam/scverif/"
ENV MVHOME="/home/opam/maskverif"
ENV PATH=${PATH}:${HOME}/.local/bin

RUN mkdir -p ${HOME}/.local/bin \
        && mkdir -p ${SCVHOME}

RUN opam depext conf-m4 conf-gmp \
        && opam install ocamlfind ocamlbuild menhir \
        zarith ocamlgraph batteries ppx_deriving ppx_import re
RUN eval $(opam env)

# get and build maskverif
RUN eval $(opam env) && git clone https://gitlab.com/benjgregoire/maskverif.git ${MVHOME} 
WORKDIR ${MVHOME}
RUN eval $(opam env) && make all


