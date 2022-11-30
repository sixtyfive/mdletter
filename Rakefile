task :default do
  rm_f '*.pdf'
  Dir['*.md'].each do |md|
    next if %w[README.md NOTES.md].include? md
    print "#{md} => "
    html = md.gsub /\.md/, '.html'
    css = md.gsub /\.md/, '.css'
    tpl = md.gsub /\.md/, '.template.html'
    pdf = md.gsub /\.md/, '.pdf'
    `pandoc #{md} -o #{html} --css templates/#{css} --template templates/#{tpl} --standalone`
    print "#{html} "
    `google-chrome-stable --headless --print-to-pdf-no-header --no-margins --print-to-pdf=#{pdf} #{html} >/dev/null 2>&1`
    print "#{pdf}\n"
  end
end
