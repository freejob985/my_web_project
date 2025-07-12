/// RegionData class represents data for a region in the bar chart
/// It contains the name of the region and the number of properties in that region
class RegionData {
  /// The name of the region (e.g., "الرياض")
  final String name;
  
  /// The number of properties in this region
  final int value;

  /// Constructor for creating a RegionData object
  /// 
  /// [name] is the region name
  /// [value] is the number of properties in the region
  RegionData({
    required this.name,
    required this.value,
  });
} 