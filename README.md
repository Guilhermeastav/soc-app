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

Cada grupo trabalha num **fork** deste repositório. O `main` do fork é um espelho do `main`
daqui: ele recebe o estado de referência do app toda semana e **nunca recebe commit do grupo**.
Todo trabalho acontece em branches.

### Uma vez, ao começar

1. Um integrante faz o fork deste repositório no GitHub e adiciona os demais como colaboradores
   (Settings → Collaborators).
2. Cada integrante clona o fork e registra este repositório como `upstream`:

```bash
git clone https://github.com/<grupo>/soc-app.git
cd soc-app
git remote add upstream https://github.com/guipaiva/soc-app.git
flutter pub get
flutter run -d chrome
```

### Toda semana

```bash
git checkout main
git pull upstream main          # traz o estado de referência da semana
git push origin main            # (opcional) deixa o fork no GitHub igual ao main
git checkout -b aula-06         # um branch por atividade, com o número da aula
# ... trabalho, commits ...
git push origin aula-06
```

Depois, no GitHub, abra um Pull Request **dentro do fork**: em *base repository* escolha o
**fork do grupo** (não este repositório), base `main`, compare `aula-06`. O GitHub sugere este
repositório como base por padrão; troque antes de criar. Cole o link do PR no Canvas.

**Não faça merge do PR.** Ele existe para mostrar o diff; o `main` do fork continua intocado, e
na semana seguinte o `git pull upstream main` entra sem conflito.

O PR precisa compilar (`flutter analyze` sem erros) e a tela precisa abrir com `flutter run -d chrome`.

### Se o `main` do fork saiu do lugar

Alguém commitou ou fez merge em `main` e o `git pull upstream main` reclama de conflito. Volte o
`main` para o estado de referência:

```bash
git fetch upstream
git checkout main
git reset --hard upstream/main
git push --force origin main
```

Isso descarta o que estava em `main` no fork. Trabalho feito em branches não é afetado.
