use <MCAD/boxes.scad>

$fa = 1;
$fs = 0.4;

module wheel(X, Y, Z) {
    translate([X, Y, Z]) {
    difference() {
        sphere(r=10);
        
        translate([-10, 5, -10]) {
            cube([40, 20, 20]);
        }
        
        rotate([-90, 0, 0]) {
            cylinder(h=20, r=2);
        }

        translate([-10, -20, -10]) {
            cube([40, 20, 20]);
        }
        
    }
    }
}

module car() {
    cube([100, 50, 10], center=true);

    translate([-10, 0, 10]) {
        cube([50, 50, 10], center=true);


    wheel(30, 25, -10);
    wheel(30, -30, -10);

    wheel(-30, 25, -10);
    wheel(-30, -30, -10);
}}

module mainCar(X, R, G, B) {
    color([R/255, G/255, B/255])
    scale([0.5, 0.5, 0.5])
    translate([X, 0, 10])
    car();
}

module road(N1, N2, N3, N4, N5) {
    color([0.5, 0.5, 0.5])
    cube([1000, 50, 2], center=true);
    mainCar(N1, 91, 252, 114);
    mainCar(N2, 125, 100, 125);
    mainCar(N3, 226, 96, 54);
    mainCar(N4, 67, 232, 158);
    mainCar(N5, 71, 69, 167);
}

road(-100, -420, 200, 400, 700);
rotate([0, 0, 180])
translate([0, 50, 0])
road(-500, -100, 200, 400, 700);