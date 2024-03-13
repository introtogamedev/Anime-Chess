#macro STARTING_X_COORDINATE 150
#macro STARTING_Y_POSITION 100
#macro HORIZONTAL_LENGTH 8
#macro VERTICAL_LENGTH 6

space_tile_ccordinates = [0, 0];
space_tile = instance_create_layer(0, 0, "Instances_1", hehe);

grid = [];

function create_grid(){
	var vertical_position = STARTING_Y_POSITION;
	var initial_coordinate_v = 0;
	var initial_coordinate_n = 0;
	
	for (var h = 0; h < VERTICAL_LENGTH; h++){
		
		if (h % 2 == 1 /*odd row*/){
			var buffer_2 = -1 * ((h - 1)/2);
		} else /*even row*/{
			var buffer_2 = -1 * (h/2);
		}
		
		if ((h + 1) % 2 == 1){
			var buffer_1 = h/2;
		} else {
			var buffer_1 = (h + 1)/2;
		}
		
		for (var i = 0; i < HORIZONTAL_LENGTH; i++){
			//odd or even row
			if (h % 2 == 0){
				var begin_x = STARTING_X_COORDINATE;
			} else {
				var begin_x = STARTING_X_COORDINATE + 45;
			}
			var obj = instance_create_layer(begin_x + i * 90, vertical_position, "Instances", tile);
			obj.x_assignment = buffer_1 + i;
			obj.y_assignment = buffer_2 + i + 2;
			//creates array with object coordinates and object itself
			var arr = [obj, obj.x_assignment, obj.y_assignment];
			array_push(grid, arr);
		}
		vertical_position += 70;
	}
}

create_grid();