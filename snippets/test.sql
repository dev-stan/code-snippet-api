CREATE TRIGGER trg_Klienci_InsteadOfDelete
INSTEAD OF DELETE ON Aktywni_Klienci
FOR EACH ROW
BEGIN
    -- Zamiast usunąć, oznaczamy jako nieaktywny
    UPDATE Klienci
    SET czy_aktywny = 0, data_usuniecia = NOW()
    WHERE klient_id = OLD.klient_id;
END;