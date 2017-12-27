XPCoin-WhitePaper-ja
====================

XPCoin whitepaper の日本語訳プロジェクトです。

# 翻訳への参加
1. 英語->日本語はGoogle翻訳ツールを使用して翻訳しています。
  I have shared a translation with you called " whitepaper ": https://translate.google.com/toolkit/workbench?did=003a70x01ta6mx9se4u8 
2. 日本語に翻訳したものをRyoがmdに転記してプルリクを上げます。
3. プルリクに対しては、日本語をより伝わりやすいものになるようにレビューをお願いします。

# 前準備
Docker版を使用する場合はDockerが必要です。

それ以外ではpandoc, imagemagick, そして LaTeX のパッケージが必要です。

## Windows
T.B.D

## macOS

```
brew install pandoc imagemagick
```

latex 環境は [TeX Live](https://texwiki.texjp.org/?TeX%20Live%2FMac) でのインストールがおすすめです。

## Linux
T.B.D

## Docker
LaTeXなどのPDFをビルドする環境はDockerfileに記載しています。

DockerイメージをDockerHubに配置する予定はありませんので、この環境を利用するには
このリポジトリにあるDockerfileを使用し、Dockerイメージを作成してください。
(例ではxpwp-jaという名前のDockerイメージを作成します)

```shell
$ docker build -t xpwp-ja .
```

Dockerイメージを作成したら、ホスト側のディレクトリをマウントするオプションを
つけてコンテナを起動します。

```shell
$ docker run -it --rm -v </path/to/sourcecode>:/root/source xpwp-jp /bin/bash

(LinuxならこれでもOK)
$ docker run -it --rm -v $(pwd):/root/source xpwp-jp /bin/bash
```

上記例ではホスト側のディレクトリをコンテナ内の`/root/source`にマウントして
います。あとはコンテナ内でPDFをビルドすれば、成果品をホスト側でも
すぐに見ることができます。

```shell
(コンテナ内)
# cd /root/source
# make
```

# ビルド方法

```
make
```

XXPCoin-Whitepaper-ja.pdf が作成されます。
