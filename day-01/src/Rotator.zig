const std = @import("std");

pub const Rotation = struct {
    direction: Direction,
    degrees: i32,

    const Direction = enum { left, right };

    pub fn init(instruction: []const u8) !Rotation {
        const direction = if (instruction[0] == 'L') Direction.left else Direction.right;
        const deg: i32 = try std.fmt.parseInt(i32, instruction[1..instruction.len], 10);
        return .{ .direction = direction, .degrees = deg };
    }

    pub fn rotate(rotation: Rotation, pos: i32) i32 {
        switch (rotation.direction) {
            .left => {
                return rotateLeft(pos, rotation.degrees);
            },
            .right => {
                return rotateRight(pos, rotation.degrees);
            },
        }
    }

    fn rotateLeft(pos: i32, deg: i32) i32 {
        const result = pos - deg;
        return if ((result < 0) and (result < -100)) rotateLeft(result, 100 - result) 
            else if (result == -100) 0
            else if (result < 0) 100 - result 
            else result;
    }

    fn rotateRight(pos: i32, deg: i32) i32 {
        const mod_deg = @mod(deg,100);
        const result = pos + mod_deg;
        return if(result>100) result - 100 else return result;
    }
};
