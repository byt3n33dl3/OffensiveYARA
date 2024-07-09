rule Win32_Ransomware_CryptoBit : tc_detection malicious
{
    meta:

        author              = "ReversingLabs"

        source              = "ReversingLabs"
        status              = "RELEASED"
        sharing             = "TLP:WHITE"
        category            = "MALWARE"
        malware             = "CRYPTOBIT"
        description         = "Yara rule that detects CryptoBit ransomware."

        tc_detection_type   = "Ransomware"
        tc_detection_name   = "CryptoBit"
        tc_detection_factor = 5

    strings:

        $encrypt_files_p1 = {
            55 8B EC 83 C4 ?? C7 45 ?? ?? ?? ?? ?? C7 45 ?? ?? ?? ?? ?? C7 45 ?? ?? ?? ?? ?? 83 
            7D ?? ?? 75 ?? FF 75 ?? EB ?? 6A ?? 59 83 C9 ?? 83 F1 ?? 89 4D ?? 6A ?? 6A ?? 6A ?? 
            6A ?? 6A ?? FF 75 ?? E8 ?? ?? ?? ?? 0B C0 0F 84 ?? ?? ?? ?? 89 45 ?? 60 BE ?? ?? ?? 
            ?? 56 64 FF 35 ?? ?? ?? ?? 64 89 25 ?? ?? ?? ?? C7 45 ?? ?? ?? ?? ?? 8B 45 ?? 33 D2 
            8B 0D ?? ?? ?? ?? F7 F1 0B C0 74 ?? FF 35 ?? ?? ?? ?? EB ?? 52 8B 0C 24 29 4D ?? 51 
            FF 75 ?? 6A ?? 68 ?? ?? ?? ?? FF 75 ?? E8 ?? ?? ?? ?? 59 0B C0 74 ?? 89 45 ?? 51 FF 
            75 ?? E8 ?? ?? ?? ?? 83 7D ?? ?? 75 ?? 83 7D ?? ?? 75 ?? 89 45 ?? 89 4D ?? FF 75 ?? 
            E8 ?? ?? ?? ?? EB ?? EB ?? 83 7D ?? ?? 75 ?? C7 45 ?? ?? ?? ?? ?? EB ?? A1 ?? ?? ?? 
            ?? 01 45 ?? EB ?? EB ?? 8B 64 24 ?? 64 8F 05 ?? ?? ?? ?? 83 C4 ?? 61 EB ?? EB ?? 64 
            8F 05 ?? ?? ?? ?? 83 C4 ?? FF 75 ?? E8 ?? ?? ?? ?? 83 7D ?? ?? 74 ?? 8B 45 ?? 8B 4D 
            ?? EB ?? 8B 45 ?? C9 C2 
        }

        $encrypt_files_p2 = {
            55 8B EC 83 C4 ?? C7 45 ?? ?? ?? ?? ?? C7 45 ?? ?? ?? ?? ?? C7 45 ?? ?? ?? ?? ?? 6A 
            ?? 6A ?? 6A ?? 6A ?? 6A ?? 68 ?? ?? ?? ?? FF 75 ?? E8 ?? ?? ?? ?? 83 F8 ?? 0F 84 ?? 
            ?? ?? ?? 89 45 ?? 8D 45 ?? 50 FF 75 ?? E8 ?? ?? ?? ?? 83 F8 ?? 75 ?? E8 ?? ?? ?? ?? 
            0B C0 74 ?? E9 ?? ?? ?? ?? 89 45 ?? 8B 15 ?? ?? ?? ?? 8B 4D ?? 0B C9 75 ?? 83 F8 ?? 
            73 ?? E9 ?? ?? ?? ?? EB ?? 0B C9 75 ?? 3B C2 73 ?? 50 EB ?? 52 8F 45 ?? 83 7D ?? ?? 
            75 ?? A1 ?? ?? ?? ?? 39 45 ?? 72 ?? FF 75 ?? FF 75 ?? FF 75 ?? FF 75 ?? E8 ?? ?? ?? 
            ?? 89 45 ?? 0B C0 74 ?? 6A ?? 50 51 FF 75 ?? E8 ?? ?? ?? ?? E9 ?? ?? ?? ?? 6A ?? 6A 
            ?? 6A ?? 6A ?? 6A ?? FF 75 ?? E8 ?? ?? ?? ?? 0B C0 74 ?? 89 45 ?? 60 BE ?? ?? ?? ?? 
            56 64 FF 35 ?? ?? ?? ?? 64 89 25 ?? ?? ?? ?? FF 75 ?? 6A ?? 6A ?? 68 ?? ?? ?? ?? FF 
            75 ?? E8 ?? ?? ?? ?? 0B C0 74 ?? 50 8B 4D ?? 8B 04 24 83 C9 ?? 83 F1 ?? 51 50 E8 ?? 
            ?? ?? ?? 89 45 ?? 0B C0 74 ?? 6A ?? 50 51 FF 75 ?? E8 ?? ?? ?? ?? E8 ?? ?? ?? ?? EB 
            ?? 8B 64 24 ?? 64 8F 05 ?? ?? ?? ?? 83 C4 ?? 61 EB ?? EB ?? 64 8F 05 ?? ?? ?? ?? 83 
            C4 ?? 83 7D ?? ?? 74 ?? FF 75 ?? E8 ?? ?? ?? ?? 83 7D ?? ?? 74 ?? FF 75 ?? E8 ?? ?? 
            ?? ?? 83 7D ?? ?? 74 ?? 8B 45 ?? 8B 4D ?? EB ?? 33 C0 33 C9 C9 C2 
        }

        $find_files_p1 = {
            55 8B EC 83 C4 ?? 57 56 C7 45 ?? ?? ?? ?? ?? C7 45 ?? ?? ?? ?? ?? C7 45 ?? ?? ?? ?? 
            ?? C7 45 ?? ?? ?? ?? ?? 8B 75 ?? 83 7E ?? ?? 75 ?? E8 ?? ?? ?? ?? 50 8D 46 ?? 50 E8 
            ?? ?? ?? ?? 23 C0 0F 84 ?? ?? ?? ?? EB ?? 83 7E ?? ?? 75 ?? FF 35 ?? ?? ?? ?? 8D 46 
            ?? 50 E8 ?? ?? ?? ?? 23 C0 0F 84 ?? ?? ?? ?? 68 ?? ?? ?? ?? E8 ?? ?? ?? ?? 23 C0 0F 
            84 ?? ?? ?? ?? 89 45 ?? B9 ?? ?? ?? ?? 68 ?? ?? ?? ?? E8 ?? ?? ?? ?? 23 C0 0F 84 ?? 
            ?? ?? ?? 89 45 ?? 8B 75 ?? 8B 7D ?? 68 ?? ?? ?? ?? 57 56 E8 ?? ?? ?? ?? 8D 57 ?? 8B 
            47 ?? D1 E0 C7 04 10 ?? ?? ?? ?? C6 44 10 ?? ?? FF 75 ?? 8D 47 ?? 50 E8 ?? ?? ?? ?? 
            83 F8 ?? 0F 84 ?? ?? ?? ?? 89 45 ?? 8B 55 ?? 8B 75 ?? 8B 7D ?? 8B 02 25 ?? ?? ?? ?? 
            0F 85 ?? ?? ?? ?? 8B 02 83 E0 ?? 0F 85 ?? ?? ?? ?? 8B 02 83 E0 ?? F7 02 ?? ?? ?? ?? 
            0F 85 ?? ?? ?? ?? 8D 47 ?? 50 8D 46 ?? 50 E8 ?? ?? ?? ?? 8B 55 ?? 8D 42 ?? 50 8D 47 
            ?? 50 E8 ?? ?? ?? ?? 8D 47 ?? 50 E8 ?? ?? ?? ?? 8B 55 ?? 89 47 ?? F7 02 ?? ?? ?? ?? 
            74 ?? 68 ?? ?? ?? ?? 8D 47 ?? 50 E8 ?? ?? ?? ?? FF 77 ?? 8D 47 ?? 50 E8 ?? ?? ?? ?? 
            83 F8 ?? 74 ?? 83 F8 ?? 75 ?? 48 50 FF 76 ?? 8D 47 ?? 50 E8 ?? ?? ?? ?? 0B C0 75
        }

        $find_files_p2 = {
            0B C9 74 ?? FF 45 ?? E9 ?? ?? ?? ?? 83 7A ?? ?? 0F 84 ?? ?? ?? ?? 81 7A ?? ?? ?? ?? 
            ?? 0F 84 ?? ?? ?? ?? F7 02 ?? ?? ?? ?? 0F 85 ?? ?? ?? ?? F7 02 ?? ?? ?? ?? 0F 85 ?? 
            ?? ?? ?? 68 ?? ?? ?? ?? E8 ?? ?? ?? ?? 0B C0 74 ?? 8B F8 FF 76 ?? 8F 47 ?? FF 76 ?? 
            8F 47 ?? FF 36 8F 07 8D 47 ?? 50 8D 46 ?? 50 E8 ?? ?? ?? ?? 8B 55 ?? 8D 42 ?? 50 8D 
            47 ?? 50 E8 ?? ?? ?? ?? 68 ?? ?? ?? ?? 8D 47 ?? 50 E8 ?? ?? ?? ?? 8D 47 ?? 50 E8 ?? 
            ?? ?? ?? 89 47 ?? 83 3F ?? 75 ?? 57 68 ?? ?? ?? ?? FF 76 ?? E8 ?? ?? ?? ?? 0B C0 75 
            ?? 57 E8 ?? ?? ?? ?? EB ?? 57 E8 ?? ?? ?? ?? EB ?? E9 ?? ?? ?? ?? FF 75 ?? FF 75 ?? 
            E8 ?? ?? ?? ?? 0B C0 0F 85 ?? ?? ?? ?? FF 75 ?? E8 ?? ?? ?? ?? C7 45 ?? ?? ?? ?? ?? 
            8B 75 ?? 83 7D ?? ?? 74 ?? 6A ?? 68 ?? ?? ?? ?? E8 ?? ?? ?? ?? 50 E8 ?? ?? ?? ?? 8B 
            14 24 51 50 52 8D 46 ?? 50 E8 ?? ?? ?? ?? E8 ?? ?? ?? ?? 6A ?? 68 ?? ?? ?? ?? E8 ?? 
            ?? ?? ?? 50 6A ?? 68 ?? ?? ?? ?? E8 ?? ?? ?? ?? 50 D1 E1 8B 5C 24 ?? 51 50 53 8D 46 
            ?? 50 E8 ?? ?? ?? ?? E8 ?? ?? ?? ?? E8 ?? ?? ?? ?? 83 7D ?? ?? 74 ?? FF 75 ?? E8 ?? 
            ?? ?? ?? 83 7D ?? ?? 74 ?? FF 75 ?? E8 ?? ?? ?? ?? 83 7D ?? ?? 74 ?? FF 75 ?? E8 ?? 
            ?? ?? ?? 8B 45 ?? 5E 5F C9 C2
        }

        $remote_connection = {
            55 8B EC 81 C4 ?? ?? ?? ?? C7 85 ?? ?? ?? ?? ?? ?? ?? ?? C7 85 ?? ?? ?? ?? ?? ?? ?? 
            ?? 6A ?? 68 ?? ?? ?? ?? 8D 85 ?? ?? ?? ?? 50 E8 ?? ?? ?? ?? 6A ?? 6A ?? 6A ?? 6A ?? 
            6A ?? E8 ?? ?? ?? ?? 23 C0 89 85 ?? ?? ?? ?? 0F 84 ?? ?? ?? ?? 6A ?? 6A ?? 6A ?? 6A 
            ?? 6A ?? 6A ?? FF 75 ?? FF B5 ?? ?? ?? ?? E8 ?? ?? ?? ?? 0B C0 89 85 ?? ?? ?? ?? 0F 
            84 ?? ?? ?? ?? 8D 5D ?? C7 03 ?? ?? ?? ?? C7 43 ?? ?? ?? ?? ?? FF 75 ?? 8D 85 ?? ?? 
            ?? ?? 50 E8 ?? ?? ?? ?? FF 75 ?? 8D 85 ?? ?? ?? ?? 50 E8 ?? ?? ?? ?? 6A ?? 68 ?? ?? 
            ?? ?? 6A ?? 6A ?? 6A ?? 8D 85 ?? ?? ?? ?? 50 8D 45 ?? 50 FF B5 ?? ?? ?? ?? E8 ?? ?? 
            ?? ?? 89 85 ?? ?? ?? ?? 83 F8 ?? 74 ?? 6A ?? 6A ?? 6A ?? 6A ?? FF B5 ?? ?? ?? ?? E8 
            ?? ?? ?? ?? 23 C0 74 ?? 68 ?? ?? ?? ?? E8 ?? ?? ?? ?? 23 C0 89 85 ?? ?? ?? ?? 74 ?? 
            8D 85 ?? ?? ?? ?? 50 68 ?? ?? ?? ?? FF B5 ?? ?? ?? ?? FF B5 ?? ?? ?? ?? E8 ?? ?? ?? 
            ?? FF B5 ?? ?? ?? ?? 0B C0 74 ?? 83 BD ?? ?? ?? ?? ?? 74 ?? C7 85 ?? ?? ?? ?? ?? ?? 
            ?? ?? EB ?? C7 85 ?? ?? ?? ?? ?? ?? ?? ?? E8 ?? ?? ?? ?? 83 BD ?? ?? ?? ?? ?? 74 ?? 
            FF B5 ?? ?? ?? ?? E8 ?? ?? ?? ?? 83 BD ?? ?? ?? ?? ?? 74 ?? FF B5 ?? ?? ?? ?? E8 ?? 
            ?? ?? ?? 83 BD ?? ?? ?? ?? ?? 74 ?? FF B5 ?? ?? ?? ?? E8 ?? ?? ?? ?? 8B 85 ?? ?? ?? 
            ?? C9 C2
        }

    condition:
        uint16(0) == 0x5A4D and 
        (
            $remote_connection and 
            (
                all of ($find_files_p*)
            ) and 
            (
                all of ($encrypt_files_p*)
            )
        )
}