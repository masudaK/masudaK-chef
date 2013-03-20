# language: ja

機能: rbenv
  rubyのバージョンを管理して、
  自分の好きなバージョンのrubyを使う機能を提供する

  @announce
  シナリオ: '/home/vagrant/.rbenv/bin/rbenv'の実行可否を確認する
    # Given
    前提: '/home/vagrant/.rbenv/bin/rbenv'ができている
    # When
    もし: '/home/vagrant/.rbenv/bin/rbenv -v'を実行する
    # then
    ならば: 出力に以下が含まれている
      """
      rbenv
      """
