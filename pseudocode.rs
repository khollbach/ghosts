// U 11
// D 10
// L  8
// R 21

fn main() {
    let mut vuln = false;
    let mut dir = b"R";
    let mut buf = "";
    loop {
        if vuln {
            print_vulnerable();
        } else {
            print_ghost(dir);
        }

        let k = get_key();
        let a = asc(k);
        buf += k;
        if buf.len() == 16 {
            buf = buf[8..];
        }

        if buf[buf.len() - 8..] == b"UUDDLRLR" {
            easter_egg();
        } else if a == dir && !vuln {
            vuln = true;
        } else if a in b"UDLR" {
            vuln = false;
            dir = a;
        } else if vuln {
            vuln = false;
        } else {
            dir = match dir {
                b"R" => b"D",
                b"D" => b"L",
                b"L" => b"U",
                b"U" => b"R",
            };
        }
    }
}

fn get_key() -> char;

fn asc(c: char) -> u8;

fn print_ghost(dir: u8) {
    if dir == b"R" {
        println!("blinky");
    } else if dir == b"D" {
        println!("pinky");
    } else if dir == b"L" {
        println!("inky");
    } else if dir == b"U" {
        println!("clyde");
    }
}

fn print_vulnerable() {
    println!("blue squiggly");
}

fn easter_egg() {
    println!("todo");
}
