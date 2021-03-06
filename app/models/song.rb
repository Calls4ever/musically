class Song < ApplicationRecord
    has_many :plays
    has_many :users, through: :plays
    has_many :playlist_songs
    has_many :playlists, through: :playlist_songs

    def self.genres
        genres = []
        Song.all.each do |song|
          genres << song.genre
        end
        genres.uniq
    end

    def self.artists
        artists = []
        Song.all.each do |song|
            artists << song.artist
        end
        artists.uniq
    end

    def add_like
        self.likes +=1
    end

    def code
        self.url.split('=').last if self.url
    end

    def self.most_played
        play=0
        s=Song.first
        Song.all.each { |song|
        if song.number_of_plays>play
            play=song.number_of_plays
            s=song
        end

        }
        s
    end

end
