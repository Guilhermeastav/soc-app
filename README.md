# Central de Incidentes

Projeto de semestre da disciplina Programação para Web e Dispositivos Móveis (Cibersegurança).
Um painel de controle de incidentes de segurança, no estilo de um SOC: cada incidente tem
título, tipo, severidade, status e um responsável, e a equipe acompanha tudo por aqui.

## Rodando

```bash
flutter pub get
flutter run -d chrome
```

## Como trabalhar no projeto

Todos os grupos trabalham neste repositório. O `main` é o estado de referência do app,
atualizado toda semana pelo professor, e **não recebe commit de aluno**: todo trabalho acontece
em branches, e a entrega de cada atividade é um Pull Request para `main`.

### Uma vez, ao começar

```bash
git clone https://github.com/guipaiva/soc-app.git
cd soc-app
flutter pub get
flutter run -d chrome
```

### Toda atividade

```bash
git checkout main
git pull                              # traz o estado de referência da semana
git checkout -b aula-06-grupo-03      # número da aula + número do grupo
# ... trabalho, commits ...
git push -u origin aula-06-grupo-03
```

Depois, no GitHub, abra um Pull Request do branch para `main` e cole o link no Canvas.

O PR não é mergeado: ele existe para mostrar o diff. Na semana seguinte, o `main` já traz a versão
de referência daquela atividade, e o grupo parte dela.

O PR precisa compilar (`flutter analyze` sem erros) e a tela precisa abrir com `flutter run -d chrome`.
