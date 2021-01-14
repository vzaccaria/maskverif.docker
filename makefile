SH=docker run -v $(PWD):/root/local -w /root/local --rm --entrypoint "/bin/bash" mv-latest

build-container: 
	docker build -f Dockerfile -t mv-latest .

open-shell: 
	docker run -ti -v $(PWD):/root/local -w /root/local --rm --entrypoint "/bin/bash" mv-latest

test-%:
	$(SH) -c "cat $*.mv | /home/opam/maskverif/maskverif"


