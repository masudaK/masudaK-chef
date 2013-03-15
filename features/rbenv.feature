# language: ja

機能: rbenv
  rubyのバージョンを管理して、
  自分の好きなバージョンのrubyを使う機能を提供する

  @announce
  シナリオ: rbenvコマンドがインストールされている
    前提: "~/.rbenv/bin/rbenv"ができている
    ならば: rbenvコマンドが使えるようになっている

  @announce
  シナリオ: インストールされているrubyのバージョン出力ができる
    前提: "ruby -v"と実行する
    ならば: 終了ステータスが0だ

