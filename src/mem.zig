const c = @import("c.zig");

error NoMem;

pub fn alloc(comptime T: type, n: usize) -> %[]T {
    return (&T)(c.malloc(c.size_t(n * @sizeOf(T))) ?? return error.NoMem)[0...n];
}

pub fn free(comptime T: type, mem: []T) {
    c.free((&c_void)(&mem[0]));
}
