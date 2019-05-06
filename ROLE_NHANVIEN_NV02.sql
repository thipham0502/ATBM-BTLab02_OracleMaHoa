SELECT MANV, ENCRYPT_KEY, DIENTHOAI, ENCRYPTED_LUONG FROM DB_OWNER.NHANVIEN;

--Thực thi thủ tục để giải mã lương của NV02 với key mã hóa của NV02
SET SERVEROUTPUT ON;
DECLARE 
  DECRYPTED_LUONG VARCHAR2(10);
  V_KEY RAW(32);
BEGIN
  SELECT ENCRYPT_KEY INTO V_KEY FROM DB_OWNER.NHANVIEN WHERE MANV = 'NV02';
  DB_OWNER.sp_Decrypt_NHANVIEN_Luong_1612894('NV02', V_KEY, DECRYPTED_LUONG);
  DBMS_OUTPUT.PUT_LINE ('Decrypted salary: ' || DECRYPTED_LUONG);
END;
/