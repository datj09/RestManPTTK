CREATE TABLE tblThanhVien055 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    vaitro VARCHAR(50),
    ho VARCHAR(255),
    ten VARCHAR(255)
);

INSERT INTO tblThanhVien055 (username, password, vaitro, ho, ten)
VALUES
	('admin', '1', 'quanli', 'Nguyễn Văn', 'A'),
	('minhlq', '1', 'nvbanhang', 'Lê Quang', 'Minh'),
	('duytv', '1', 'nvbanhang', 'Trần Văn', 'Duy'),
    ('datnc', '1', 'khachhang', 'Nguyễn Công', 'Đạt'),
    ('tuanbh', '1', 'khachhang', 'Bùi Hoàng', 'Tuấn'),
    ('hoaht', '1', 'khachhang', 'Hoàng Thị', 'Hoa'),
    ('linhtt', '1', 'khachhang', 'Trần Thị', 'Linh'),
    ('phuongtt', '1', 'khachhang', 'Trần Thị', 'Phương'),
    ('haont', '1', 'khachhang', 'Nguyễn Thị', 'Hào'),
    ('quangpv', '1', 'khachhang', 'Phạm Văn', 'Quang'),
    ('duyentt', '1', 'khachhang', 'Trần Thị', 'Duyên'),
    ('toannd', '1', 'khachhang', 'Nguyễn Đình', 'Toàn'),
    ('khoald', '1', 'khachhang', 'Lê Đăng', 'Khoa');

CREATE TABLE tblMonAn055 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    ten VARCHAR(255) NOT NULL,
    gia float(10) NOT NULL,
    mota VARCHAR(255)
);

INSERT INTO tblMonAn055 (ten, gia, mota)
VALUES
    ('Cua hoàng đế', 2000000, 'Cua biển tươi sống đặc sản'),
    ('Tôm hùm', 1500000, 'Tôm hùm Canada tươi sống'),
    ('Sườn nướng BBQ', 300000, 'Sườn heo nướng với sốt BBQ'),
    ('Gà rán', 80000, 'Gà rán giòn rụm'),
    ('Phở bò', 60000, 'Phở bò với nước dùng đậm đà'),
    ('Bánh mì thịt nướng', 25000, 'Bánh mì thịt nướng kiểu Việt Nam'),
    ('Cua rang me', 1800000, 'Cua biển rang với sốt me'),
    ('Tôm sốt Thái', 450000, 'Tôm càng sốt chua cay kiểu Thái'),
    ('Súp cua', 70000, 'Súp cua với thịt cua và trứng cút'),
    ('Cháo hàu', 90000, 'Cháo hàu bổ dưỡng'),
    ('Bò lúc lắc', 250000, 'Thịt bò mềm xào với rau củ'),
    ('Cá hồi nướng', 350000, 'Cá hồi nướng cùng sốt teriyaki'),
    ('Gỏi cuốn', 50000, 'Gỏi cuốn tươi ngon'),
    ('Lẩu Thái', 400000, 'Lẩu Thái chua cay đặc biệt'),
    ('Mì Ý sốt bò bằm', 120000, 'Mì Ý truyền thống với sốt bò bằm'),
    ('Pizza hải sản', 180000, 'Pizza với các loại hải sản tươi sống'),
    ('Salad trộn', 60000, 'Salad rau củ tươi mát'),
    ('Kem vani', 20000, 'Kem vani mát lạnh'),
    ('Bánh xèo', 40000, 'Bánh xèo Việt Nam giòn tan'),
    ('Chè thập cẩm', 30000, 'Chè thập cẩm ngọt mát');
    
CREATE TABLE tblCombo055 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    ten VARCHAR(255) NOT NULL,
    gia float(10) NOT NULL,
    mota VARCHAR(255)
);

INSERT INTO tblCombo055 (ten, gia, mota)
VALUES
    ('Combo hải sản đặc biệt', 3000000, 'Bao gồm cua hoàng đế, tôm hùm và súp cua'),
    ('Combo BBQ nướng', 600000, 'Sườn nướng BBQ, gà rán và salad trộn'),
    ('Combo lẩu Thái', 800000, 'Lẩu Thái, gỏi cuốn và chè thập cẩm'),
    ('Combo ăn sáng Việt', 90000, 'Phở bò, bánh mì thịt nướng và cà phê'),
    ('Combo hẹn hò', 400000, 'Pizza hải sản, salad trộn và kem vani');


CREATE TABLE tblCombo_Monan055 (
    comboId INT NOT NULL,
    monAnId INT NOT NULL,
    FOREIGN KEY (comboId) REFERENCES tblcombo055(id),
    FOREIGN KEY (monAnId) REFERENCES tblmonan055(id),
    PRIMARY KEY (comboId, monAnId)
);

INSERT INTO tblCombo_Monan055 (comboId, monAnId)
VALUES
    -- Combo hải sản đặc biệt
    (1, 1), -- Cua hoàng đế
    (1, 2), -- Tôm hùm
    (1, 9), -- Súp cua

    -- Combo BBQ nướng
    (2, 3), -- Sườn nướng BBQ
    (2, 4), -- Gà rán
    (2, 17), -- Salad trộn

    -- Combo lẩu Thái
    (3, 14), -- Lẩu Thái
    (3, 13), -- Gỏi cuốn
    (3, 20), -- Chè thập cẩm

    -- Combo ăn sáng Việt
    (4, 5), -- Phở bò
    (4, 6), -- Bánh mì thịt nướng

    -- Combo hẹn hò
    (5, 16), -- Pizza hải sản
    (5, 17), -- Salad trộn
    (5, 18); -- Kem vani

CREATE TABLE tblBanAn055 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    soBan INT NOT NULL UNIQUE,         -- Số bàn ăn (duy nhất)
    trangThai VARCHAR(50) DEFAULT 'Trống',  -- Trạng thái bàn ăn (ví dụ: Trống, Đang sử dụng)
    ghiChu VARCHAR(255)
);

INSERT INTO tblBanAn055 (soBan, trangThai, ghiChu)
VALUES
    (1, 'Trống', NULL),
    (2, 'Trống', 'Bàn gần cửa sổ'),
    (3, 'Trống', 'Bàn ngoài trời'),
    (4, 'Trống', 'Bàn trong phòng VIP'),
    (5, 'Trống', NULL),
    (6, 'Trống', 'Bàn gần khu vực quầy bar'),
    (7, 'Đang sử dụng', 'Bàn đặt trước'),
    (8, 'Đang sử dụng', 'Bàn trong khu vực riêng tư'),
    (9, 'Trống', 'Bàn có tầm nhìn đẹp'),
    (10, 'Trống', NULL),
    (11, 'Đang sử dụng', 'Bàn cho nhóm khách'),
    (12, 'Đang sử dụng', 'Bàn trong phòng riêng'),
    (13, 'Trống', 'Bàn ở sân thượng'),
    (14, 'Trống', 'Bàn có trang trí đặc biệt'),
    (15, 'Trống', NULL);


CREATE TABLE tblDonDatHang055 (
    id INT AUTO_INCREMENT PRIMARY KEY,  -- ID đồng thời là mã đơn hàng
    ngayDat DATE NOT NULL,              -- Ngày đặt hàng
    maKH INT,                           -- Mã khách hàng (foreign key từ tblthanhvien)
    maBan INT,                          -- Mã bàn (foreign key từ tblbanan)
    FOREIGN KEY (maKH) REFERENCES tblthanhvien055(id),
    FOREIGN KEY (maBan) REFERENCES tblbanan055(id)
);

INSERT INTO tblDonDatHang055 (ngayDat, maKH, maBan)
VALUES
    ('2024-01-05', 4, 1),
    ('2024-01-05', 5, 2),
    ('2024-01-05', 6, 3),
    ('2024-01-06', 4, 4),
    ('2024-01-06', 5, 1),
    ('2024-01-06', 7, 2),
    ('2024-01-07', 4, 5),
    ('2024-01-07', 6, 6),
    ('2024-01-07', 8, 2),
    ('2024-01-08', 9, 3),
    ('2024-01-08', 10, 4),
    ('2024-01-09', 4, 5),
    ('2024-01-09', 5, 6),
    ('2024-01-10', 7, 7),
    ('2024-01-10', 6, 8),
    ('2024-01-10', 9, 9),
    ('2024-01-11', 4, 1),
    ('2024-01-11', 8, 2),
    ('2024-01-12', 5, 3),
    ('2024-01-12', 10, 4);

CREATE TABLE tblMonDuocDat055 (
    donDatHangId INT NOT NULL,      -- ID đơn đặt hàng từ tbldondathang
    monAnId INT NOT NULL,           -- Mã món ăn (foreign key từ tblmonan)
    soLuong INT NOT NULL,           -- Số lượng món ăn trong đơn
    tongGia FLOAT NOT NULL,         -- Tổng giá của món ăn với số lượng đặt
    FOREIGN KEY (donDatHangId) REFERENCES tbldondathang055(id),
    FOREIGN KEY (monAnId) REFERENCES tblmonan055(id),
    PRIMARY KEY (donDatHangId, monAnId)
);

INSERT INTO tblMonDuocDat055 (donDatHangId, monAnId, soLuong, tongGia)
VALUES
    (1, 1, 2, 4000000),  -- 2 Cua hoàng đế giá 2,000,000 mỗi con
    (1, 2, 1, 1500000),  -- 1 Tôm hùm giá 1,500,000
    (2, 3, 5, 1500000),  -- 5 Sườn nướng BBQ giá 300,000 mỗi phần
    (3, 5, 4, 240000),   -- 4 Phở bò giá 60,000 mỗi tô
    (4, 1, 2, 4000000),  -- 2 Cua hoàng đế giá 2,000,000 mỗi con
    (5, 6, 3, 75000),    -- 3 Bánh mì thịt nướng giá 25,000 mỗi cái
    (6, 9, 1, 70000),    -- 1 Súp cua giá 70,000
    (7, 8, 2, 900000),   -- 2 Tôm sốt Thái giá 450,000 mỗi phần
    (8, 4, 3, 240000),   -- 3 Gà rán giá 80,000 mỗi phần
    (9, 7, 1, 1800000),  -- 1 Cua rang me giá 1,800,000
    (10, 10, 2, 180000), -- 2 Cháo hàu giá 90,000 mỗi tô
    (11, 1, 2, 4000000),  -- 2 Cua hoàng đế giá 2,000,000 mỗi con
    (11, 2, 1, 1500000),  -- 1 Tôm hùm giá 1,500,000
    (12, 5, 3, 180000),   -- 3 Phở bò giá 60,000 mỗi tô
    (13, 4, 4, 320000),   -- 4 Gà rán giá 80,000 mỗi phần
    (14, 8, 1, 450000),   -- 1 Tôm sốt Thái giá 450,000
    (15, 2, 2, 3000000),  -- 2 Tôm hùm giá 1,500,000 mỗi con
    (16, 7, 1, 1800000),  -- 1 Cua rang me giá 1,800,000
    (17, 3, 4, 1200000),  -- 4 Sườn nướng BBQ giá 300,000 mỗi phần
    (18, 6, 5, 125000),   -- 5 Bánh mì thịt nướng giá 25,000 mỗi phần
    (19, 9, 2, 140000),   -- 2 Súp cua giá 70,000 mỗi bát
    (20, 1, 1, 2000000);  -- 1 Cua hoàng đế giá 2,000,000

CREATE TABLE tblComboDuocDat055 (
    donDatHangId INT NOT NULL,      -- ID đơn đặt hàng từ tbldondathang
    comboId INT NOT NULL,           -- Mã combo (foreign key từ tblcombo)
    soLuong INT NOT NULL,           -- Số lượng combo trong đơn
    tongGia FLOAT NOT NULL,         -- Tổng giá của combo với số lượng đặt
    FOREIGN KEY (donDatHangId) REFERENCES tbldondathang055(id),
    FOREIGN KEY (comboId) REFERENCES tblcombo055(id),
    PRIMARY KEY (donDatHangId, comboId)
);

INSERT INTO tblComboDuocDat055 (donDatHangId, comboId, soLuong, tongGia)
VALUES
    (1, 1, 1, 3000000),    -- 1 Combo hải sản đặc biệt giá 3,000,000
    (2, 2, 2, 1200000),    -- 2 Combo BBQ nướng giá 600,000 mỗi combo
    (3, 3, 1, 800000),     -- 1 Combo lẩu Thái giá 800,000
    (4, 4, 1, 90000),      -- 1 Combo ăn sáng Việt giá 90,000
    (5, 5, 1, 400000),     -- 1 Combo hẹn hò giá 400,000
    (6, 1, 2, 6000000),    -- 2 Combo hải sản đặc biệt giá 3,000,000 mỗi combo
    (7, 3, 1, 800000),     -- 1 Combo lẩu Thái giá 800,000
    (8, 4, 2, 180000),     -- 2 Combo ăn sáng Việt giá 90,000 mỗi combo
    (9, 2, 1, 600000),     -- 1 Combo BBQ nướng giá 600,000
    (10, 5, 2, 800000),    -- 2 Combo hẹn hò giá 400,000 mỗi combo
    (11, 1, 1, 3000000),    -- 1 Combo hải sản đặc biệt giá 3,000,000
    (12, 2, 2, 1200000),    -- 2 Combo BBQ nướng giá 600,000 mỗi combo
    (13, 3, 1, 800000),     -- 1 Combo lẩu Thái giá 800,000
    (14, 4, 2, 180000),     -- 2 Combo ăn sáng Việt giá 90,000 mỗi combo
    (15, 5, 1, 400000),     -- 1 Combo hẹn hò giá 400,000
    (16, 1, 2, 6000000),    -- 2 Combo hải sản đặc biệt giá 3,000,000 mỗi combo
    (17, 3, 3, 2400000),    -- 3 Combo lẩu Thái giá 800,000 mỗi combo
    (18, 4, 1, 90000),      -- 1 Combo ăn sáng Việt giá 90,000
    (19, 2, 1, 600000),     -- 1 Combo BBQ nướng giá 600,000
    (20, 5, 2, 800000);     -- 2 Combo hẹn hò giá 400,000 mỗi combos


CREATE TABLE tblHoaDon055 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    donDatHangId INT NOT NULL,         -- ID đơn đặt hàng từ tbldondathang
    maNV INT NOT NULL,                 -- Mã nhân viên bán hàng (foreign key từ tblthanhvien)
    ngayTao DATE NOT NULL,              -- Ngày tạo hóa đơn
    phuongThucThanhToan VARCHAR(100),   -- Phương thức thanh toán (VD: Tiền mặt, Thẻ)
    tongTien FLOAT NOT NULL,            -- Tổng tiền của hóa đơn
    FOREIGN KEY (donDatHangId) REFERENCES tbldondathang055(id),
    FOREIGN KEY (maNV) REFERENCES tblthanhvien055(id)
);

INSERT INTO tblHoaDon055 (donDatHangId, maNV, ngayTao, phuongThucThanhToan, tongTien)
VALUES
    (1, 2, '2024-01-05', 'Tiền mặt', 8500000),    -- Đơn hàng 1, tổng tiền từ các món và combo
    (2, 3, '2024-01-08', 'Thẻ', 2700000),         -- Đơn hàng 2, tổng tiền từ các món và combo
    (3, 2, '2024-01-09', 'Tiền mặt', 1040000),    -- Đơn hàng 3, tổng tiền từ các món và combo
    (4, 2, '2024-01-10', 'Tiền mặt', 4090000),    -- Đơn hàng 4, tổng tiền từ các món và combo
    (5, 3, '2024-01-11', 'Thẻ', 475000),          -- Đơn hàng 5, tổng tiền từ các món và combo
    (6, 2, '2024-01-12', 'Tiền mặt', 6070000),    -- Đơn hàng 6, tổng tiền từ các món và combo
    (7, 3, '2024-01-12', 'Thẻ', 1700000),         -- Đơn hàng 7, tổng tiền từ các món và combo
    (8, 2, '2024-01-13', 'Tiền mặt', 510000),     -- Đơn hàng 8, tổng tiền từ các món và combo
    (9, 3, '2024-01-14', 'Thẻ', 2400000),         -- Đơn hàng 9, tổng tiền từ các món và combo
    (10, 2, '2024-01-15', 'Tiền mặt', 1600000),   -- Đơn hàng 10, tổng tiền từ các món và combo
    (11, 3, '2024-01-16', 'Thẻ', 1000000),        -- Đơn hàng 11, tổng tiền từ các món và combo
    (12, 2, '2024-01-16', 'Tiền mặt', 3250000),   -- Đơn hàng 12, tổng tiền từ các món và combo
    (13, 2, '2024-01-17', 'Thẻ', 870000),         -- Đơn hàng 13, tổng tiền từ các món và combo
    (14, 3, '2024-01-18', 'Tiền mặt', 455000),    -- Đơn hàng 14, tổng tiền từ các món và combo
    (15, 2, '2024-01-18', 'Thẻ', 3900000),        -- Đơn hàng 15, tổng tiền từ các món và combo
    (16, 3, '2024-01-19', 'Tiền mặt', 320000),    -- Đơn hàng 16, tổng tiền từ các món và combo
    (17, 2, '2024-01-20', 'Thẻ', 670000),         -- Đơn hàng 17, tổng tiền từ các món và combo
    (18, 3, '2024-01-20', 'Tiền mặt', 2900000),   -- Đơn hàng 18, tổng tiền từ các món và combo
    (19, 2, '2024-01-21', 'Thẻ', 600000),         -- Đơn hàng 19, tổng tiền từ các món và combo
    (20, 3, '2024-01-22', 'Tiền mặt', 880000);    -- Đơn hàng 20, tổng tiền từ các món và combo

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetComboDuocDat`(IN donDatHangId INT)
BEGIN
    SELECT c.id, c.ten, dc.soLuong, c.gia, dc.tongGia
    FROM tblcomboduocdat055 dc
    JOIN tblcombo055 c ON dc.comboId = c.id
    WHERE dc.donDatHangId = donDatHangId;
END

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetMonDuocDat`(IN donDatHangId INT)
BEGIN
    SELECT m.id, m.ten, SUM(dm.soLuong) AS soLuong, m.gia, SUM(dm.soLuong * m.gia) AS tongGia
    FROM tblmonduocdat055 dm
    JOIN tblmonan055 m ON dm.monAnId = m.id
    WHERE dm.donDatHangId = donDatHangId
    GROUP BY m.id;
END

CREATE DEFINER=`root`@`localhost` PROCEDURE `HoaDonChiTiet`(IN donDatHangId INT)
BEGIN
    SELECT h.id, h.phuongThucThanhToan, h.ngayTao, h.tongtien, d.maBan,
           nv.id AS maNV, nv.ho AS hoNV, nv.ten AS tenNV,
           k.id AS maKH, k.ho AS hoKH, k.ten AS tenKH
    FROM tblhoadon055 h
    JOIN tbldondathang055 d ON h.donDatHangId = d.id
    JOIN tblthanhvien055 k ON d.maKH = k.id
    JOIN tblthanhvien055 nv ON h.maNV = nv.id
    WHERE h.donDatHangId = donDatHangId;
END

CREATE DEFINER=`root`@`localhost` PROCEDURE `kiemtraDN`(IN usr VARCHAR(255), IN pwd VARCHAR(255))
BEGIN
	SELECT * FROM tblthanhvien055
			WHERE username = usr AND password = pwd;
END

CREATE DEFINER=`root`@`localhost` PROCEDURE `ThongTinMonAn`(IN idMonAn INT)
BEGIN
    SELECT * FROM tblmonan055 WHERE id = idMonAn;
END

CREATE DEFINER=`root`@`localhost` PROCEDURE `TKCacLanGoiMonAn`(IN monAnId INT)
BEGIN
    SELECT dm.donDatHangId, dm.soLuong, dm.tongGia, ddh.ngayDat
    FROM tblmonduocdat055 dm
    JOIN tbldondathang055 ddh ON dm.donDatHangId = ddh.id
    WHERE dm.monAnId = monAnId
    ORDER BY ddh.ngayDat;
END

CREATE DEFINER=`root`@`localhost` PROCEDURE `TKMonAnTheoDoanhThu`(IN startDate DATE, IN endDate DATE)
BEGIN
    SELECT 
        ma.monAnId AS idMonAn,
        m.ten AS tenMonAn,
        m.gia AS gia,
        SUM(ma.soLuong) AS soLuongMA,
        SUM(ma.tongGia) AS doanhThu
    FROM tblmonduocdat055 AS ma
    JOIN tblmonan055 AS m ON ma.monAnId = m.id
    JOIN tbldondathang055 AS ddh ON ddh.id = ma.donDatHangId
    WHERE ddh.ngayDat BETWEEN startDate AND endDate
    GROUP BY ma.monAnId, m.ten, m.gia;
END

