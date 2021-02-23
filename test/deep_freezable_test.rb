require "minitest/autorun"
require "./lib/bank.rb"
require "./lib/team.rb"

class DeepFreezableTest < Minitest::Test
  def test_deep_freeze_to_array
    #配列の値チェック
    assert_equal ["Japan", "US", "India"], Team::COUNTRIES
    #配列がFreezeされているか
    assert Team::COUNTRIES.frozen?
    #配列の要素がすべてFreezeされているか
    assert Team::COUNTRIES.all? { |country| country.frozen? }
  end

  def test_deep_freeze_to_hash
    #配列の値チェック
    assert_equal(
      { "Japan" => "yen", "US" => "dollar", "India" => "rupee" },
      Bank::COUNTRIES
    )
    #配列がFreezeされているか
    assert Bank::COUNTRIES.frozen?
    #配列の要素がすべてFreezeされているか
    assert Bank::COUNTRIES.all? { |key, value| key.frozen? && value.frozen? }
  end
end
