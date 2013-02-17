languages = {
  :ruby => "rb",
  :io => "io"
}

languages.each_pair do |language, extension|
  namespace language do
    [:day1, :day2, :day3].each do |day|
      filename = "#{language}/#{day}.#{extension}"

      if File.exists?(filename)
        desc "Run #{language} homework for #{day}"
        task day do
          puts "Running #{language} #{filename}"
          puts `#{language} #{filename}`
        end
      end
    end
  end
end

