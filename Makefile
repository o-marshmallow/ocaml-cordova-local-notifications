NAME=notifications
PACKAGE=-package gen_js_api,js_of_ocaml
all:
	ocamlfind gen_js_api/gen_js_api $(NAME).mli
	ocamlfind ocamlc $(PACKAGE) $(NAME).mli
	ocamlfind ocamlc -c -package gen_js_api.ppx $(PACKAGE) $(NAME).ml
	ocamlfind ocamlc -a -package gen_js_api.ppx -o $(NAME).cma $(NAME).cmo

install: all
	ocamlfind install ocaml-cordova-local-notifications META *.cma *.cmi

mrproper:
	rm -rf maps *.cmi *.cmo *.cma

clean:
	rm -rf $(NAME) $(NAME).ml *.cmi *.cmo *.cma
