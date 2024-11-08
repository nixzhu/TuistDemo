# TuistDemo

Demo project to reproduce issue https://github.com/tuist/tuist/issues/6994

## Steps

Use Tuist 4.31.0

```sh
mise use tuist@4.31.0
make
```

Run the project, add a DemoWidget. You should see a battery icon in the widget.

Close Xcode.

Use Tuist 4.32.0

```sh
mise use tuist@4.32.0
make
```

Run the project again. The battery icon disappeared in the widget.