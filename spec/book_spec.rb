require 'spec_helper'

describe User do
  let(:book) { Book.new(title: "Coding for Dummies", author: "James", isbn: 1234567) }

    it "has a title" do
      expect(book.title).to eq("Coding for Dummies")
    end

    it "has an author" do
      expect(book.author).to eq("James")
    end

    it "has an isbn" do 
      expect(book.isbn).to eq(1234567)
    end
end

