Controller = function()
{
	function createGrid()
	{
    var data = [
			{"company":"0. Johnson & Johnson","price":64.72,"change":0.06,"pct_change":0.09,"last_change":"9\/1 12:00am","_id":1,"_parent":null,"_level":1,"_lft":1,"_rgt":98,"_is_leaf":false},
			{"company":"1. American International Group, Inc.","price":64.13,"change":0.31,"pct_change":0.49,"last_change":"9\/1 12:00am","_id":2,"_parent":1,"_level":2,"_lft":2,"_rgt":17,"_is_leaf":false},
			{"company":"2. Alcoa Inc","price":29.01,"change":0.42,"pct_change":1.47,"last_change":"9\/1 12:00am","_id":3,"_parent":1,"_level":2,"_lft":18,"_rgt":65,"_is_leaf":false},
			{"company":"3. The Coca-Cola Company","price":45.07,"change":0.26,"pct_change":0.58,"last_change":"9\/1 12:00am","_id":4,"_parent":1,"_level":2,"_lft":66,"_rgt":79,"_is_leaf":false},
			{"company":"4. Citigroup, Inc.","price":49.37,"change":0.02,"pct_change":0.04,"last_change":"9\/1 12:00am","_id":5,"_parent":null,"_level":1,"_lft":99,"_rgt":100,"_is_leaf":true},
			{"company":"5. Hewlett-Packard Co.","price":36.53,"change":-0.03,"pct_change":-0.08,"last_change":"9\/1 12:00am","_id":6,"_parent":null,"_level":1,"_lft":101,"_rgt":118,"_is_leaf":false},
			{"company":"6. McDonald's Corporation","price":36.76,"change":0.86,"pct_change":2.4,"last_change":"9\/1 12:00am","_id":7,"_parent":1,"_level":2,"_lft":80,"_rgt":85,"_is_leaf":false},
			{"company":"7. The Procter & Gamble Company","price":61.91,"change":0.01,"pct_change":0.02,"last_change":"9\/1 12:00am","_id":8,"_parent":4,"_level":3,"_lft":67,"_rgt":76,"_is_leaf":false},
			{"company":"8. Johnson & Johnson","price":64.72,"change":0.06,"pct_change":0.09,"last_change":"9\/1 12:00am","_id":9,"_parent":2,"_level":3,"_lft":3,"_rgt":6,"_is_leaf":false},
			{"company":"9. Microsoft Corporation","price":25.84,"change":0.14,"pct_change":0.54,"last_change":"9\/1 12:00am","_id":10,"_parent":7,"_level":3,"_lft":81,"_rgt":82,"_is_leaf":true},
			{"company":"10. E.I. du Pont de Nemours and Company","price":40.48,"change":0.51,"pct_change":1.28,"last_change":"9\/1 12:00am","_id":11,"_parent":3,"_level":3,"_lft":19,"_rgt":36,"_is_leaf":false},
			{"company":"11. Honeywell Intl Inc","price":38.77,"change":0.05,"pct_change":0.13,"last_change":"9\/1 12:00am","_id":12,"_parent":11,"_level":4,"_lft":20,"_rgt":29,"_is_leaf":false},
			{"company":"12. Microsoft Corporation","price":25.84,"change":0.14,"pct_change":0.54,"last_change":"9\/1 12:00am","_id":13,"_parent":4,"_level":3,"_lft":77,"_rgt":78,"_is_leaf":true},
			{"company":"13. American International Group, Inc.","price":64.13,"change":0.31,"pct_change":0.49,"last_change":"9\/1 12:00am","_id":14,"_parent":null,"_level":1,"_lft":119,"_rgt":122,"_is_leaf":false},
			{"company":"14. Hewlett-Packard Co.","price":36.53,"change":-0.03,"pct_change":-0.08,"last_change":"9\/1 12:00am","_id":15,"_parent":null,"_level":1,"_lft":123,"_rgt":136,"_is_leaf":false},
			{"company":"15. 3m Co","price":71.72,"change":0.02,"pct_change":0.03,"last_change":"9\/1 12:00am","_id":16,"_parent":6,"_level":2,"_lft":102,"_rgt":103,"_is_leaf":true},
			{"company":"16. International Business Machines","price":81.41,"change":0.44,"pct_change":0.54,"last_change":"9\/1 12:00am","_id":17,"_parent":1,"_level":2,"_lft":86,"_rgt":95,"_is_leaf":false},
			{"company":"17. International Business Machines","price":81.41,"change":0.44,"pct_change":0.54,"last_change":"9\/1 12:00am","_id":18,"_parent":12,"_level":5,"_lft":21,"_rgt":26,"_is_leaf":false},
			{"company":"18. Verizon Communications","price":35.57,"change":0.39,"pct_change":1.11,"last_change":"9\/1 12:00am","_id":19,"_parent":17,"_level":3,"_lft":87,"_rgt":92,"_is_leaf":false},
			{"company":"19. JP Morgan & Chase & Co","price":45.73,"change":0.07,"pct_change":0.15,"last_change":"9\/1 12:00am","_id":20,"_parent":11,"_level":4,"_lft":30,"_rgt":35,"_is_leaf":false},
			{"company":"20. Merck & Co., Inc.","price":40.96,"change":0.41,"pct_change":1.01,"last_change":"9\/1 12:00am","_id":21,"_parent":3,"_level":3,"_lft":37,"_rgt":46,"_is_leaf":false},
			{"company":"21. Altria Group Inc","price":83.81,"change":0.28,"pct_change":0.34,"last_change":"9\/1 12:00am","_id":22,"_parent":null,"_level":1,"_lft":137,"_rgt":138,"_is_leaf":true},
			{"company":"22. Alcoa Inc","price":29.01,"change":0.42,"pct_change":1.47,"last_change":"9\/1 12:00am","_id":23,"_parent":6,"_level":2,"_lft":104,"_rgt":109,"_is_leaf":false},
			{"company":"23. American International Group, Inc.","price":64.13,"change":0.31,"pct_change":0.49,"last_change":"9\/1 12:00am","_id":24,"_parent":15,"_level":2,"_lft":124,"_rgt":133,"_is_leaf":false},
			{"company":"24. Johnson & Johnson","price":64.72,"change":0.06,"pct_change":0.09,"last_change":"9\/1 12:00am","_id":25,"_parent":23,"_level":3,"_lft":105,"_rgt":108,"_is_leaf":false},
			{"company":"25. American Express Company","price":52.55,"change":0.01,"pct_change":0.02,"last_change":"9\/1 12:00am","_id":26,"_parent":2,"_level":3,"_lft":7,"_rgt":10,"_is_leaf":false},
			{"company":"26. Johnson & Johnson","price":64.72,"change":0.06,"pct_change":0.09,"last_change":"9\/1 12:00am","_id":27,"_parent":24,"_level":3,"_lft":125,"_rgt":130,"_is_leaf":false},
			{"company":"27. Microsoft Corporation","price":25.84,"change":0.14,"pct_change":0.54,"last_change":"9\/1 12:00am","_id":28,"_parent":null,"_level":1,"_lft":139,"_rgt":158,"_is_leaf":false},
			{"company":"28. Hewlett-Packard Co.","price":36.53,"change":-0.03,"pct_change":-0.08,"last_change":"9\/1 12:00am","_id":29,"_parent":3,"_level":3,"_lft":47,"_rgt":48,"_is_leaf":true},
			{"company":"29. Altria Group Inc","price":83.81,"change":0.28,"pct_change":0.34,"last_change":"9\/1 12:00am","_id":30,"_parent":21,"_level":4,"_lft":38,"_rgt":41,"_is_leaf":false},
			{"company":"30. The Coca-Cola Company","price":45.07,"change":0.26,"pct_change":0.58,"last_change":"9\/1 12:00am","_id":31,"_parent":null,"_level":1,"_lft":159,"_rgt":160,"_is_leaf":true},
			{"company":"31. International Business Machines","price":81.41,"change":0.44,"pct_change":0.54,"last_change":"9\/1 12:00am","_id":32,"_parent":3,"_level":3,"_lft":49,"_rgt":52,"_is_leaf":false},
			{"company":"32. United Technologies Corporation","price":63.26,"change":0.55,"pct_change":0.88,"last_change":"9\/1 12:00am","_id":33,"_parent":26,"_level":4,"_lft":8,"_rgt":9,"_is_leaf":true},
			{"company":"33. McDonald's Corporation","price":36.76,"change":0.86,"pct_change":2.4,"last_change":"9\/1 12:00am","_id":34,"_parent":6,"_level":2,"_lft":110,"_rgt":111,"_is_leaf":true},
			{"company":"34. Exxon Mobil Corp","price":68.1,"change":-0.43,"pct_change":-0.64,"last_change":"9\/1 12:00am","_id":35,"_parent":28,"_level":2,"_lft":140,"_rgt":149,"_is_leaf":false},
			{"company":"35. Exxon Mobil Corp","price":68.1,"change":-0.43,"pct_change":-0.64,"last_change":"9\/1 12:00am","_id":36,"_parent":3,"_level":3,"_lft":53,"_rgt":62,"_is_leaf":false},
			{"company":"36. Altria Group Inc","price":83.81,"change":0.28,"pct_change":0.34,"last_change":"9\/1 12:00am","_id":37,"_parent":19,"_level":4,"_lft":88,"_rgt":91,"_is_leaf":false},
			{"company":"37. The Home Depot, Inc.","price":34.64,"change":0.35,"pct_change":1.02,"last_change":"9\/1 12:00am","_id":38,"_parent":36,"_level":4,"_lft":54,"_rgt":59,"_is_leaf":false},
			{"company":"38. Pfizer Inc","price":27.96,"change":0.4,"pct_change":1.45,"last_change":"9\/1 12:00am","_id":39,"_parent":21,"_level":4,"_lft":42,"_rgt":43,"_is_leaf":true},
			{"company":"39. The Coca-Cola Company","price":45.07,"change":0.26,"pct_change":0.58,"last_change":"9\/1 12:00am","_id":40,"_parent":6,"_level":2,"_lft":112,"_rgt":117,"_is_leaf":false},
			{"company":"40. The Procter & Gamble Company","price":61.91,"change":0.01,"pct_change":0.02,"last_change":"9\/1 12:00am","_id":41,"_parent":8,"_level":4,"_lft":68,"_rgt":73,"_is_leaf":false},
			{"company":"41. International Business Machines","price":81.41,"change":0.44,"pct_change":0.54,"last_change":"9\/1 12:00am","_id":42,"_parent":15,"_level":2,"_lft":134,"_rgt":135,"_is_leaf":true},
			{"company":"42. 3m Co","price":71.72,"change":0.02,"pct_change":0.03,"last_change":"9\/1 12:00am","_id":43,"_parent":24,"_level":3,"_lft":131,"_rgt":132,"_is_leaf":true},
			{"company":"43. Intel Corporation","price":19.88,"change":0.31,"pct_change":1.58,"last_change":"9\/1 12:00am","_id":44,"_parent":7,"_level":3,"_lft":83,"_rgt":84,"_is_leaf":true},
			{"company":"44. Alcoa Inc","price":29.01,"change":0.42,"pct_change":1.47,"last_change":"9\/1 12:00am","_id":45,"_parent":38,"_level":5,"_lft":55,"_rgt":58,"_is_leaf":false},
			{"company":"45. Boeing Co.","price":75.43,"change":0.53,"pct_change":0.71,"last_change":"9\/1 12:00am","_id":46,"_parent":45,"_level":6,"_lft":56,"_rgt":57,"_is_leaf":true},
			{"company":"46. International Business Machines","price":81.41,"change":0.44,"pct_change":0.54,"last_change":"9\/1 12:00am","_id":47,"_parent":30,"_level":5,"_lft":39,"_rgt":40,"_is_leaf":true},
			{"company":"47. Merck & Co., Inc.","price":40.96,"change":0.41,"pct_change":1.01,"last_change":"9\/1 12:00am","_id":48,"_parent":null,"_level":1,"_lft":161,"_rgt":162,"_is_leaf":true},
			{"company":"48. Intel Corporation","price":19.88,"change":0.31,"pct_change":1.58,"last_change":"9\/1 12:00am","_id":49,"_parent":27,"_level":4,"_lft":126,"_rgt":129,"_is_leaf":false},
			{"company":"49. Alcoa Inc","price":29.01,"change":0.42,"pct_change":1.47,"last_change":"9\/1 12:00am","_id":50,"_parent":21,"_level":4,"_lft":44,"_rgt":45,"_is_leaf":true},
			{"company":"50. Wal-Mart Stores, Inc.","price":45.45,"change":0.73,"pct_change":1.63,"last_change":"9\/1 12:00am","_id":51,"_parent":2,"_level":3,"_lft":11,"_rgt":16,"_is_leaf":false},
			{"company":"51. Alcoa Inc","price":29.01,"change":0.42,"pct_change":1.47,"last_change":"9\/1 12:00am","_id":52,"_parent":3,"_level":3,"_lft":63,"_rgt":64,"_is_leaf":true},
			{"company":"52. Boeing Co.","price":75.43,"change":0.53,"pct_change":0.71,"last_change":"9\/1 12:00am","_id":53,"_parent":null,"_level":1,"_lft":163,"_rgt":164,"_is_leaf":true},
			{"company":"53. 3m Co","price":71.72,"change":0.02,"pct_change":0.03,"last_change":"9\/1 12:00am","_id":54,"_parent":25,"_level":4,"_lft":106,"_rgt":107,"_is_leaf":true},
			{"company":"54. International Business Machines","price":81.41,"change":0.44,"pct_change":0.54,"last_change":"9\/1 12:00am","_id":55,"_parent":null,"_level":1,"_lft":165,"_rgt":170,"_is_leaf":false},
			{"company":"55. E.I. du Pont de Nemours and Company","price":40.48,"change":0.51,"pct_change":1.28,"last_change":"9\/1 12:00am","_id":56,"_parent":35,"_level":3,"_lft":141,"_rgt":144,"_is_leaf":false},
			{"company":"56. Intel Corporation","price":19.88,"change":0.31,"pct_change":1.58,"last_change":"9\/1 12:00am","_id":57,"_parent":32,"_level":4,"_lft":50,"_rgt":51,"_is_leaf":true},
			{"company":"57. American International Group, Inc.","price":64.13,"change":0.31,"pct_change":0.49,"last_change":"9\/1 12:00am","_id":58,"_parent":35,"_level":3,"_lft":145,"_rgt":146,"_is_leaf":true},
			{"company":"58. Exxon Mobil Corp","price":68.1,"change":-0.43,"pct_change":-0.64,"last_change":"9\/1 12:00am","_id":59,"_parent":18,"_level":6,"_lft":22,"_rgt":23,"_is_leaf":true},
			{"company":"59. Alcoa Inc","price":29.01,"change":0.42,"pct_change":1.47,"last_change":"9\/1 12:00am","_id":60,"_parent":null,"_level":1,"_lft":171,"_rgt":172,"_is_leaf":true},
			{"company":"60. Johnson & Johnson","price":64.72,"change":0.06,"pct_change":0.09,"last_change":"9\/1 12:00am","_id":61,"_parent":null,"_level":1,"_lft":173,"_rgt":174,"_is_leaf":true},
			{"company":"61. McDonald's Corporation","price":36.76,"change":0.86,"pct_change":2.4,"last_change":"9\/1 12:00am","_id":62,"_parent":41,"_level":5,"_lft":69,"_rgt":72,"_is_leaf":false},
			{"company":"62. Alcoa Inc","price":29.01,"change":0.42,"pct_change":1.47,"last_change":"9\/1 12:00am","_id":63,"_parent":51,"_level":4,"_lft":12,"_rgt":15,"_is_leaf":false},
			{"company":"63. Johnson & Johnson","price":64.72,"change":0.06,"pct_change":0.09,"last_change":"9\/1 12:00am","_id":64,"_parent":17,"_level":3,"_lft":93,"_rgt":94,"_is_leaf":true},
			{"company":"64. Microsoft Corporation","price":25.84,"change":0.14,"pct_change":0.54,"last_change":"9\/1 12:00am","_id":65,"_parent":36,"_level":4,"_lft":60,"_rgt":61,"_is_leaf":true},
			{"company":"65. Verizon Communications","price":35.57,"change":0.39,"pct_change":1.11,"last_change":"9\/1 12:00am","_id":66,"_parent":63,"_level":5,"_lft":13,"_rgt":14,"_is_leaf":true},
			{"company":"66. General Motors Corporation","price":30.27,"change":1.09,"pct_change":3.74,"last_change":"9\/1 12:00am","_id":67,"_parent":null,"_level":1,"_lft":175,"_rgt":176,"_is_leaf":true},
			{"company":"67. Microsoft Corporation","price":25.84,"change":0.14,"pct_change":0.54,"last_change":"9\/1 12:00am","_id":68,"_parent":37,"_level":5,"_lft":89,"_rgt":90,"_is_leaf":true},
			{"company":"68. Wal-Mart Stores, Inc.","price":45.45,"change":0.73,"pct_change":1.63,"last_change":"9\/1 12:00am","_id":69,"_parent":28,"_level":2,"_lft":150,"_rgt":157,"_is_leaf":false},
			{"company":"69. The Home Depot, Inc.","price":34.64,"change":0.35,"pct_change":1.02,"last_change":"9\/1 12:00am","_id":70,"_parent":null,"_level":1,"_lft":177,"_rgt":182,"_is_leaf":false},
			{"company":"70. E.I. du Pont de Nemours and Company","price":40.48,"change":0.51,"pct_change":1.28,"last_change":"9\/1 12:00am","_id":71,"_parent":55,"_level":2,"_lft":166,"_rgt":169,"_is_leaf":false},
			{"company":"71. General Electric Company","price":34.14,"change":-0.08,"pct_change":-0.23,"last_change":"9\/1 12:00am","_id":72,"_parent":49,"_level":5,"_lft":127,"_rgt":128,"_is_leaf":true},
			{"company":"72. Exxon Mobil Corp","price":68.1,"change":-0.43,"pct_change":-0.64,"last_change":"9\/1 12:00am","_id":73,"_parent":14,"_level":2,"_lft":120,"_rgt":121,"_is_leaf":true},
			{"company":"73. Citigroup, Inc.","price":49.37,"change":0.02,"pct_change":0.04,"last_change":"9\/1 12:00am","_id":74,"_parent":null,"_level":1,"_lft":183,"_rgt":184,"_is_leaf":true},
			{"company":"74. Wal-Mart Stores, Inc.","price":45.45,"change":0.73,"pct_change":1.63,"last_change":"9\/1 12:00am","_id":75,"_parent":40,"_level":3,"_lft":113,"_rgt":116,"_is_leaf":false},
			{"company":"75. Microsoft Corporation","price":25.84,"change":0.14,"pct_change":0.54,"last_change":"9\/1 12:00am","_id":76,"_parent":9,"_level":4,"_lft":4,"_rgt":5,"_is_leaf":true},
			{"company":"76. Microsoft Corporation","price":25.84,"change":0.14,"pct_change":0.54,"last_change":"9\/1 12:00am","_id":77,"_parent":35,"_level":3,"_lft":147,"_rgt":148,"_is_leaf":true},
			{"company":"77. E.I. du Pont de Nemours and Company","price":40.48,"change":0.51,"pct_change":1.28,"last_change":"9\/1 12:00am","_id":78,"_parent":56,"_level":4,"_lft":142,"_rgt":143,"_is_leaf":true},
			{"company":"78. E.I. du Pont de Nemours and Company","price":40.48,"change":0.51,"pct_change":1.28,"last_change":"9\/1 12:00am","_id":79,"_parent":69,"_level":3,"_lft":151,"_rgt":156,"_is_leaf":false},
			{"company":"79. General Motors Corporation","price":30.27,"change":1.09,"pct_change":3.74,"last_change":"9\/1 12:00am","_id":80,"_parent":70,"_level":2,"_lft":178,"_rgt":181,"_is_leaf":false},
			{"company":"80. 3m Co","price":71.72,"change":0.02,"pct_change":0.03,"last_change":"9\/1 12:00am","_id":81,"_parent":null,"_level":1,"_lft":185,"_rgt":186,"_is_leaf":true},
			{"company":"81. The Coca-Cola Company","price":45.07,"change":0.26,"pct_change":0.58,"last_change":"9\/1 12:00am","_id":82,"_parent":null,"_level":1,"_lft":187,"_rgt":190,"_is_leaf":false},
			{"company":"82. Honeywell Intl Inc","price":38.77,"change":0.05,"pct_change":0.13,"last_change":"9\/1 12:00am","_id":83,"_parent":null,"_level":1,"_lft":191,"_rgt":192,"_is_leaf":true},
			{"company":"83. American Express Company","price":52.55,"change":0.01,"pct_change":0.02,"last_change":"9\/1 12:00am","_id":84,"_parent":12,"_level":5,"_lft":27,"_rgt":28,"_is_leaf":true},
			{"company":"84. International Business Machines","price":81.41,"change":0.44,"pct_change":0.54,"last_change":"9\/1 12:00am","_id":85,"_parent":null,"_level":1,"_lft":193,"_rgt":194,"_is_leaf":true},
			{"company":"85. Microsoft Corporation","price":25.84,"change":0.14,"pct_change":0.54,"last_change":"9\/1 12:00am","_id":86,"_parent":71,"_level":3,"_lft":167,"_rgt":168,"_is_leaf":true},
			{"company":"86. Pfizer Inc","price":27.96,"change":0.4,"pct_change":1.45,"last_change":"9\/1 12:00am","_id":87,"_parent":null,"_level":1,"_lft":195,"_rgt":196,"_is_leaf":true},
			{"company":"87. The Home Depot, Inc.","price":34.64,"change":0.35,"pct_change":1.02,"last_change":"9\/1 12:00am","_id":88,"_parent":75,"_level":4,"_lft":114,"_rgt":115,"_is_leaf":true},
			{"company":"88. General Electric Company","price":34.14,"change":-0.08,"pct_change":-0.23,"last_change":"9\/1 12:00am","_id":89,"_parent":null,"_level":1,"_lft":197,"_rgt":198,"_is_leaf":true},
			{"company":"89. Caterpillar Inc.","price":67.27,"change":0.92,"pct_change":1.39,"last_change":"9\/1 12:00am","_id":90,"_parent":8,"_level":4,"_lft":74,"_rgt":75,"_is_leaf":true},
			{"company":"90. The Procter & Gamble Company","price":61.91,"change":0.01,"pct_change":0.02,"last_change":"9\/1 12:00am","_id":91,"_parent":82,"_level":2,"_lft":188,"_rgt":189,"_is_leaf":true},
			{"company":"91. The Home Depot, Inc.","price":34.64,"change":0.35,"pct_change":1.02,"last_change":"9\/1 12:00am","_id":92,"_parent":18,"_level":6,"_lft":24,"_rgt":25,"_is_leaf":true},
			{"company":"92. International Business Machines","price":81.41,"change":0.44,"pct_change":0.54,"last_change":"9\/1 12:00am","_id":93,"_parent":1,"_level":2,"_lft":96,"_rgt":97,"_is_leaf":true},
			{"company":"93. AT&T Inc.","price":31.61,"change":-0.48,"pct_change":-1.54,"last_change":"9\/1 12:00am","_id":94,"_parent":79,"_level":4,"_lft":152,"_rgt":155,"_is_leaf":false},
			{"company":"94. Intel Corporation","price":19.88,"change":0.31,"pct_change":1.58,"last_change":"9\/1 12:00am","_id":95,"_parent":20,"_level":5,"_lft":31,"_rgt":34,"_is_leaf":false},
			{"company":"95. Alcoa Inc","price":29.01,"change":0.42,"pct_change":1.47,"last_change":"9\/1 12:00am","_id":96,"_parent":62,"_level":6,"_lft":70,"_rgt":71,"_is_leaf":true},
			{"company":"96. The Home Depot, Inc.","price":34.64,"change":0.35,"pct_change":1.02,"last_change":"9\/1 12:00am","_id":97,"_parent":null,"_level":1,"_lft":199,"_rgt":200,"_is_leaf":true},
			{"company":"97. McDonald's Corporation","price":36.76,"change":0.86,"pct_change":2.4,"last_change":"9\/1 12:00am","_id":98,"_parent":95,"_level":6,"_lft":32,"_rgt":33,"_is_leaf":true},
			{"company":"98. General Electric Company","price":34.14,"change":-0.08,"pct_change":-0.23,"last_change":"9\/1 12:00am","_id":99,"_parent":94,"_level":5,"_lft":153,"_rgt":154,"_is_leaf":true},
			{"company":"99. Boeing Co.","price":75.43,"change":0.53,"pct_change":0.71,"last_change":"9\/1 12:00am","_id":100,"_parent":80,"_level":3,"_lft":179,"_rgt":180,"_is_leaf":true}
		];
   
    // add in some dummy descriptions and loaded flag
		for (var i = 0; i < data.length; i++) {
    	data[i].desc = 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Sed metus nibh, sodales a, porta at, vulputate eget, dui. Pellentesque ut nisl. Maecenas tortor turpis, interdum non, sodales non, iaculis ac, lacus. Vestibulum auctor, tortor quis iaculis malesuada, libero lectus bibendum purus, sit amet tincidunt quam turpis vel lacus. In pellentesque nisl non sem. Suspendisse nunc sem, pretium eget, cursus a, fringilla vel, urna.<br/><br/>Aliquam commodo ullamcorper erat. Nullam vel justo in neque porttitor laoreet. Aenean lacus dui, consequat eu, adipiscing eget, nonummy non, nisi. Morbi nunc est, dignissim non, ornare sed, luctus eu, massa. Vivamus eget quam. Vivamus tincidunt diam nec urna. Curabitur velit.';
    	data[i]._is_loaded = true;
		}
		
		var expander = new Ext.grid.RowExpander({
      tpl : new Ext.Template(
          '<p><b>Company:</b> {company}</p><br>',
          '<p><b>Summary:</b> {desc}</p>'
      )
    });

    // create the data store
    var record = Ext.data.Record.create([
   		{name: 'company'},
     	{name: 'price', type: 'float'},
     	{name: 'change', type: 'float'},
     	{name: 'pct_change', type: 'float'},
     	{name: 'last_change', type: 'date', dateFormat: 'n/j h:ia'},
     	{name: 'desc'},
     	{name: '_id', type: 'int'},
     	{name: '_level', type: 'int'},
     	{name: '_lft', type: 'int'},
     	{name: '_rgt', type: 'int'},
     	{name: '_is_leaf', type: 'bool'}
   	]);
    var store = new Ext.ux.maximgb.treegrid.NestedSetStore({
    	autoLoad : true,
			reader: new Ext.data.JsonReader({id: '_id'}, record),
			proxy: new Ext.data.MemoryProxy(data)
    });
    // create the Grid
    var grid = new Ext.ux.maximgb.treegrid.GridPanel({
      store: store,
      master_column_id : 'company',
      columns: [
      	expander,
				{id:'company',header: "Company", width: 160, sortable: true, dataIndex: 'company'},
        {header: "Price", width: 75, sortable: true, renderer: 'usMoney', dataIndex: 'price'},
        {header: "Change", width: 75, sortable: true, renderer: change, dataIndex: 'change'},
        {header: "% Change", width: 75, sortable: true, renderer: pctChange, dataIndex: 'pct_change'},
        {header: "Last Updated", width: 85, sortable: true, renderer: Ext.util.Format.dateRenderer('m/d/Y'), dataIndex: 'last_change'}
      ],
      stripeRows: true,
      autoExpandColumn: 'company',
      title: 'Array Grid',
      root_title: 'Companies', 
      plugins: expander,
      viewConfig : {
      	enableRowBody : true
      }
    });
    var vp = new Ext.Viewport({
    	layout : 'fit',
    	items : grid
    });
    grid.getSelectionModel().selectFirstRow();
	}
	
	// example of custom renderer function
  function change(val)
  {
    if (val > 0) {
      val = '<span style="color:green;">' + val + '</span>';
    } 
    else if(val < 0) {
			val = '<span style="color:red;">' + val + '</span>';
    }
    return val;
  }

  // example of custom renderer function
  function pctChange(val)
  {
    if (val > 0) {
      val = '<span style="color:green;">' + val + '%</span>';
    } 
    else if(val < 0) {
      val = '<span style="color:red;">' + val + '%</span>';
    }
    return val;
  }

	return {
		init : function()
		{
			createGrid();
		}
	}
}();

Ext.onReady(Controller.init);