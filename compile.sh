#!/bin/zsh

# スクリプトを実行するディレクトリに移動
cd "$(dirname "$0")"

# LaTeXファイルのベースネーム（拡張子なし）
filename="main"

# LaTeXファイルをコンパイル
# 相互参照のために二回コンパイル
platex -interaction=nonstopmode "$filename.tex"
bibtex $filename
platex -interaction=nonstopmode "$filename.tex"
platex -interaction=nonstopmode "$filename.tex"

#latexmk -pdf -pdflatex="pdflatex -interaction=nonstopmode -synctex=1" -use-make main.tex



# DVIファイルをPDFに変換
dvipdfmx "$filename"

# 不要なファイルを削除（オプション）
rm -f "$filename.aux" "$filename.dvi" "$filename.log"

# 完了メッセージ
echo "コンパイルが完了しました。"M

# 生成されたPDFを開く（オプション）
# この行をコメントアウトするか削除することで、PDFを開かないようにできます。
open "$filename.pdf"
