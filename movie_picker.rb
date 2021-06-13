class MoviePicker
  attr_reader :unseen, :seen

  UNSEEN_FILE = 'unseen.txt'
  SEEN_FILE = 'seen.txt'

  def initialize
    @unseen = File.readlines(UNSEEN_FILE)
    @seen = File.readlines(SEEN_FILE)
  end

  def sample
    movie = @unseen.sample
    @unseen.delete movie
    @seen << movie
    puts movie
    save
  end

  def reset
    @unseen = @unseen + @seen
    @seen = []
    save
  end

  def save
    File.write(UNSEEN_FILE, @unseen.join)
    File.write(SEEN_FILE, @seen.join)
  end

  def dedup
    @unseen.uniq!
    save
  end
end
