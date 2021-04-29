DOCK_MOUNTVOLUME=-v $(PWD):/root/local -w /root/local
DOCK_OPTIONS=$(DOCK_MOUNTVOLUME) --rm --entrypoint "/bin/bash" mv-latest
DOCK_RUN=docker run $(DOCK_OPTIONS) 

build-container: 
	docker build -f Dockerfile -t mv-latest .

open-shell: 
	docker run -ti $(DOCK_OPTIONS) 

run-%:
	$(DOCK_RUN) -c "cat tests/$*.mv | /home/opam/maskverif/maskverif"

test-%:
	$(DOCK_RUN) -c "cat tests/$*.mv | /home/opam/maskverif/maskverif" > $*.txt 2>&1


