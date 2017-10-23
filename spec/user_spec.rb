require 'spec_helper'

describe User do
  let(:user) { User.new(name: "olivia", username: "livy1159", password: "jamesislames") }

    it "has a name" do
      expect(user.name).to eq("olivia")
    end

    it "has a username" do
      expect(user.username).to eq("livy1159")
    end

    it "has a password" do 
      expect(user.password).to eq("jamesislames")
    end
end



  