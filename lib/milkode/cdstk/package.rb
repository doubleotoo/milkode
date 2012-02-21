# -*- coding: utf-8 -*-
#
# @file 
# @brief
# @author ongaeshi
# @date   2012/02/21

require 'milkode/common/util'

module Milkode
  class Package
    def self.create(dir, ignore=[])
      Package.new({"directory" => dir, "ignore" => ignore})
    end

    def initialize(hash)
      @hash = hash
      normalize
      @name = File.basename(directory) # @todo nameメンバに対応
    end

    attr_reader :name

    def directory
      @hash['directory']
    end

    def ignore
      @hash['ignore']
    end

    def hash
      @hash
    end

    def migrate
      @hash['ignore'] = [] unless ignore
    end

    # 同名パッケージか？
    def same_name?(rhs)
      name == rhs.name
    end

    private

    def normalize
      if (Util::platform_win?)
        @hash['directory'] = Util::normalize_filename(directory)
      end
    end
    
  end
end

