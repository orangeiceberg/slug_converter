require 'spec_helper'

describe SlugConverter do

  it 'has a version number' do
    expect(SlugConverter::VERSION).not_to be nil
  end

  describe ".number" do

    it "returns number when number is set" do
      converted_slug= SlugConverter.new(111)
      expect(converted_slug.number).to eq(111)
    end

    it "returns decoded number for existing slug" do
      converted_slug = SlugConverter.new("vg")
      expect(converted_slug.number).to eq(363)
    end

  end

  describe ".number" do

    it "sets number to given value" do
      converted_slug = SlugConverter.new(211)
      expect(converted_slug.number=210).to eq(210)
    end

    it "sets slug to encoded value of number" do
      converted_slug = SlugConverter.new(211)
      converted_slug.number=210
      expect(converted_slug.slug).to eq("pb")
    end

    it "sets number to integer value of given number passed as string" do
      converted_slug = SlugConverter.new("210")
      expect(converted_slug.number).to eq(210)
    end

    it "sets slug to encoded value of given number passed as string" do
      converted_slug = SlugConverter.new("210")
      expect(converted_slug.slug).to eq("pb")
    end

    it "sets number to integer value of argument that starts with a number but also contains letters" do
      converted_slug = SlugConverter.new("210jj")
      expect(converted_slug.number).to eq(210)
    end

    it "sets slug to encoded value of argument that starts with a number but also contains letters" do
      converted_slug = SlugConverter.new("210jj")
      expect(converted_slug.slug).to eq("pb")
    end

  end

  describe ".slug" do

     it "returns slug when slug is set" do
        converted_slug = SlugConverter.new("hy")
        expect(converted_slug.slug).to eq("hy")
     end

     it "returns encoded slug when link id is set" do
        converted_id = SlugConverter.new(113)
        expect(converted_id.slug).to eq("hy")
     end

  end

  describe ".slug" do

    it "sets slug to given value" do
      converted_slug = SlugConverter.new("ezk")
      expect(converted_slug.slug=("ebk")).to eq("ebk")
    end

    it "sets number to decoded value of slug" do
      converted_slug = SlugConverter.new("pb")
      converted_slug.slug=("ezk")
      expect(converted_slug.number).to eq(1483)
    end

    it "raises Arrgument Error exception if given value is an empty string" do
      expect { SlugConverter.new("") }.to raise_error(ArgumentError)
    end

    it "raises Arrgument Error exception if given value is nil" do
      expect { SlugConverter.new(nil) }.to raise_error(ArgumentError)
    end

    it "raises Arrgument Error exception if given value contains unpermitted letters" do
      expect { SlugConverter.new("iiii") }.to raise_error(ArgumentError)
    end

    it "raises Arrgument Error exception if given value starts with letter but contains numbers" do
      expect { SlugConverter.new("bb12") }.to raise_error(ArgumentError)
    end

  end

end
