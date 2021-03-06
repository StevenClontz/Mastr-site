class ExercisesDataSource < Nanoc::DataSource
  identifier :exercises

  def items
    items = []
    Dir.foreach("../tbil-la/exercises/build") do |standard|
      next if standard[0]=="."
      seeds = JSON.parse(File.read "../tbil-la/exercises/build/#{standard}/seeds.json")
      content = "<h2>#{seeds["title"]}</h2>\n"
      content << "<hr/>\n"
      (1..50).each do |seed_int|
        content << "<h4>Example #{seed_int}</h4>"
        content << File.read("../tbil-la/exercises/build/#{standard}/#{seed_int.to_s.rjust(3, "0")}.html")
        content << "<hr/>\n"
      end 
      items << new_item(
        content,
        {title: "#{standard} (Lin Alg)"},
        Nanoc::Identifier.new("/lin-alg/#{standard}.html"),
      )
    end
    Dir.foreach("../mastr-diff-eq/build") do |standard|
      next if standard[0]=="."
      seeds = JSON.parse(File.read "../mastr-diff-eq/build/#{standard}/seeds.json")
      content = "<h2>#{seeds["title"]}</h2>\n"
      content << "<hr/>\n"
      (1..50).each do |seed_int|
        content << "<h4>Example #{seed_int}</h4>"
        content << File.read("../mastr-diff-eq/build/#{standard}/#{seed_int.to_s.rjust(3, "0")}.html")
        content << "<hr/>\n"
      end 
      items << new_item(
        content,
        {title: "#{standard} (Diff EQ)"},
        Nanoc::Identifier.new("/diff-eq/#{standard}.html"),
      )
    end

    return items
  end
end
