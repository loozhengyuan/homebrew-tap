# `homebrew-tap`

[![ci](https://github.com/loozhengyuan/homebrew-tap/actions/workflows/ci.yml/badge.svg)](https://github.com/loozhengyuan/homebrew-tap/actions/workflows/ci.yml)

Homebrew Tap for [@loozhengyuan](https://github.com/loozhengyuan)

## Usage

To add this tap, run the following command:

```shell
brew tap loozhengyuan/tap
```

## Development

For testing _Formulae_ locally, you can run the following command. The `--verbose` and `--debug` flags can optionally be added to display additional debugging information.

```shell
brew install --formula ./Formula/unwarp.rb
```

For testing _Formulae_ from a specific branch (e.g. when reviewing PRs), you can either checkout the specific branch and run the above command or use the following one-liner:

```shell
curl -fsSL --output /tmp/unwarp.rb --proto '=https' --tlsv1.2 <FORMULA_URL> && brew install --formula /tmp/unwarp.rb && rm /tmp/unwarp.rb
```

## License

[MIT](https://choosealicense.com/licenses/mit/)
