require "application_system_test_case"

class BlueprintsTest < ApplicationSystemTestCase
  setup do
    @blueprint = blueprints(:one)
  end

  test "visiting the index" do
    visit blueprints_url
    assert_selector "h1", text: "Blueprints"
  end

  test "should create blueprint" do
    visit blueprints_url
    click_on "New blueprint"

    fill_in "Blueprint", with: @blueprint.blueprint_id
    fill_in "Craft time", with: @blueprint.craft_time
    fill_in "Merchant xp", with: @blueprint.merchant_xp
    fill_in "Name en", with: @blueprint.name_en
    fill_in "Name zh", with: @blueprint.name_zh
    fill_in "Tier", with: @blueprint.tier
    fill_in "Type", with: @blueprint.type_id
    fill_in "Value", with: @blueprint.value
    click_on "Create Blueprint"

    assert_text "Blueprint was successfully created"
    click_on "Back"
  end

  test "should update Blueprint" do
    visit blueprint_url(@blueprint)
    click_on "Edit this blueprint", match: :first

    fill_in "Blueprint", with: @blueprint.blueprint_id
    fill_in "Craft time", with: @blueprint.craft_time
    fill_in "Merchant xp", with: @blueprint.merchant_xp
    fill_in "Name en", with: @blueprint.name_en
    fill_in "Name zh", with: @blueprint.name_zh
    fill_in "Tier", with: @blueprint.tier
    fill_in "Type", with: @blueprint.type_id
    fill_in "Value", with: @blueprint.value
    click_on "Update Blueprint"

    assert_text "Blueprint was successfully updated"
    click_on "Back"
  end

  test "should destroy Blueprint" do
    visit blueprint_url(@blueprint)
    click_on "Destroy this blueprint", match: :first

    assert_text "Blueprint was successfully destroyed"
  end
end
