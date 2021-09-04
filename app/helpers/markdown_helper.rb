module MarkdownHelper
  def markdown(text)
    renderer = Redcarpet::Render::HTML.new(render_options)
    Redcarpet::Markdown.new(renderer, extensions).render(text).html_safe
  end

  private

  def render_options
    {
      filter_html: false, # htmlを無効化
      hard_wrap: true, # 改行を br 要素に変換
      link_attributes: { target: "_blank", rel: "noopener" } # リンクの設定
    }
  end

  def extensions
    {
      autolink: true, # http https ftpで始まる文字列を自動リンク
      fenced_code_blocks: true, # コードブロックを解析
      no_intra_emphasis: true, # 単語内の強調を解析しない
      tables: true, # 	テーブルを解析
      space_after_headers: true, # ヘッダーの先頭のハッシュとハッシュ名の間にスペースを要求
      hard_wrap: true, # 改行を br 要素に変換
      xhtml: true, # xhtml のタグを出力する(Render::XHTMLでは常に有効)
      lax_html_blocks: true # 複数行のコードの前後に空行が不要
      # strikethrough: true, # 取り消し線(~)を解析する
    }
  end
end
