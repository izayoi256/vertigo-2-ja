# Vertigo 2 日本語化パッチ

これは[Vertigo 2](https://store.steampowered.com/app/843390/Vertigo_2/)を日本語化するパッチです。

# 動作確認済み環境

- Windows 10

# 導入方法

## XUnity.AutoTranslatorの導入

※ 主に自動機械翻訳に使われるツールですが、本パッチではフォント置き換えのために利用します。ゲーム内のテキストは機械翻訳ではないためご安心ください。

ここではReiPatcher版を導入する方法を記します。

1. [XUnity.AutoTranslator](https://github.com/bbepis/XUnity.AutoTranslator/releases)のReiPatcher版をダウンロードして解凍する。
    - 動作確認は[5.3.0](https://github.com/bbepis/XUnity.AutoTranslator/releases/tag/v5.3.0)で行なっています。`Assets`の一覧から[XUnity.AutoTranslator-ReiPatcher-5.3.0.zip](https://github.com/bbepis/XUnity.AutoTranslator/releases/download/v5.3.0/XUnity.AutoTranslator-ReiPatcher-5.3.0.zip)を選択してください。
2. `Steamクライアント > ライブラリ > Vertigo 2 > 歯車マーク > 管理 > ローカルファイルを閲覧` をクリックして、Vertigo 2のインストール先ディレクトリを開く。
3. 1で解凍された`SetupReiPatcherAndAutoTranslator.exe`を、2で開いたディレクトリに移動する。
4. 3で移動した`SetupReiPatcherAndAutoTranslator.exe`を実行すると、同じディレクトリ内に`vertigo2 (Patch and Run)`というファイルが生成される。
5. 4で生成された`vertigo2 (Patch and Run)`を実行すると、XUnity.AutoTranslatorがインストールされて、ゲームが起動する。
6. 5で起動したゲームは一旦閉じる。

## 日本語化パッチの導入

1. [日本語化パッチ](https://github.com/izayoi256/vertigo-2-ja/archive/refs/heads/master.zip)をダウンロードして解凍する。
2. `Steamクライアント > ライブラリ > Vertigo 2 > 歯車マーク > 管理 > ローカルファイルを閲覧` をクリックして、Vertigo 2のインストール先ディレクトリを開く。
3. 1で解凍されたファイルの内`Vertigo 2`ディレクトリの中身を、2で開いたディレクトリに移動する。ファイルはすべて上書きしてください。
4. SteamクライアントでVertigo 2を起動すれば日本語化は完了です。

# パッチの適用範囲

このパッチを適用すると下記のテキストが日本語化されます。

- 字幕全般
- 図鑑全般
- UI全般
- 一部のゲーム内オブジェクト

下記のテキストは日本語化されません。

- 統計関連のUI
- 一部を除くゲーム内オブジェクト

# 免責事項

当パッチを利用して発生した、いかなる損害も責任を負いかねます。

# クレジット

- Vertigo 2 © 2023 Zulubo Productions 
- 翻訳 © 2023 Qwert(Shotaro Hama)
