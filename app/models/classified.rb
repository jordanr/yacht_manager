require 'will_paginate'
class Classified < Listing
    cattr_reader :per_page
    @@per_page = 20 
end
