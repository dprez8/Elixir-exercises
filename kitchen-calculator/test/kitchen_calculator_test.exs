ExUnit.start()
Code.require_file("../lib/kitchen_calculator.ex")

defmodule KCTest do
  use ExUnit.Case

  describe "get volume from tuple pair" do
    @tag task_id: 1
    test "get cups" do
      assert KC.get_volume({:cup, 1}) == 1
    end

    @tag task_id: 1
    test "get fluid ounces" do
      assert KC.get_volume({:fluid_ounce, 2}) == 2
    end

    @tag task_id: 1
    test "get teaspoons" do
      assert KC.get_volume({:teaspoon, 3}) == 3
    end

    @tag task_id: 1
    test "get tablespoons" do
      assert KC.get_volume({:tablespoon, 4}) == 4
    end

    @tag task_id: 1
    test "get milliliters" do
      assert KC.get_volume({:milliliter, 5}) == 5
    end
  end

  describe "convert to milliliters from" do
    @tag task_id: 2
    test "milliliters" do
      assert KC.to_milliliter({:milliliter, 3}) == {:milliliter, 3}
    end

    @tag task_id: 2
    test "cups" do
      assert KC.to_milliliter({:cup, 3}) == {:milliliter, 720}
    end

    @tag task_id: 2
    test "fluid ounces" do
      assert KC.to_milliliter({:fluid_ounce, 100}) == {:milliliter, 3000}
    end

    @tag task_id: 2
    test "teaspoon" do
      assert KC.to_milliliter({:teaspoon, 3}) == {:milliliter, 15}
    end

    @tag task_id: 2
    test "tablespoon" do
      assert KC.to_milliliter({:tablespoon, 3}) == {:milliliter, 45}
    end
  end

  describe "convert from milliliters to" do
    @tag task_id: 3
    test "milliliters" do
      assert KC.from_milliliter({:milliliter, 4}, :milliliter) == {:milliliter, 4}
    end

    @tag task_id: 3
    test "cups" do
      assert KC.from_milliliter({:milliliter, 840}, :cup) == {:cup, 3.5}
    end

    @tag task_id: 3
    test "fluid ounces" do
      assert KC.from_milliliter({:milliliter, 4522.5}, :fluid_ounce) ==
               {:fluid_ounce, 150.75}
    end

    @tag task_id: 3
    test "teaspoon" do
      assert KC.from_milliliter({:milliliter, 61.25}, :teaspoon) ==
               {:teaspoon, 12.25}
    end

    @tag task_id: 3
    test "tablespoon" do
      assert KC.from_milliliter({:milliliter, 71.25}, :tablespoon) ==
               {:tablespoon, 4.75}
    end
  end

  describe "convert from x to y:" do
    @tag task_id: 4
    test "teaspoon to tablespoon" do
      assert KC.convert({:teaspoon, 15}, :tablespoon) == {:tablespoon, 5}
    end

    @tag task_id: 4
    test "cups to fluid ounces" do
      assert KC.convert({:cup, 4}, :fluid_ounce) == {:fluid_ounce, 32}
    end

    @tag task_id: 4
    test "fluid ounces to teaspoons" do
      assert KC.convert({:fluid_ounce, 4}, :teaspoon) == {:teaspoon, 24}
    end

    @tag task_id: 4
    test "tablespoons to cups" do
      assert KC.convert({:tablespoon, 320}, :cup) == {:cup, 20}
    end
  end
end
