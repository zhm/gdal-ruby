require 'gdal/ogr'

describe "Gdal" do
  it "converts WKT to GeoJSON" do
    valid_wkt  = 'POINT (30 10)'
    valid_json = '{ "type": "Point", "coordinates": [ 30.0, 10.0 ] }'

    Gdal::Ogr.create_geometry_from_wkt(valid_wkt).export_to_json.should eq(valid_json)
  end
end
