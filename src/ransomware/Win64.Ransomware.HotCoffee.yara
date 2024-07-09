rule Win64_Ransomware_HotCoffee : tc_detection malicious
{
    meta:

        author              = "ReversingLabs"

        source              = "ReversingLabs"
        status              = "RELEASED"
        sharing             = "TLP:WHITE"
        category            = "MALWARE"
        malware             = "HOTCOFFEE"
        description         = "Yara rule that detects HotCoffee ransomware."

        tc_detection_type   = "Ransomware"
        tc_detection_name   = "HotCoffee"
        tc_detection_factor = 5

    strings:

        $find_files = {
            48 85 C9 74 ?? B8 ?? ?? ?? ?? 48 2B C1 48 85 C9 48 0F 44 C6 BA ?? ?? ?? ?? 48 2B D0
            48 8D 8D ?? ?? ?? ?? 48 8D 0C 41 74 ?? 48 05 ?? ?? ?? ?? 48 03 C2 4C 8D 0D ?? ?? ??
            ?? 4C 2B C9 0F 1F 44 00 ?? 48 85 C0 74 ?? 45 0F B7 04 09 66 45 85 C0 74 ?? 66 44 89
            01 48 83 C1 ?? 48 FF C8 48 83 EA ?? 75 ?? 48 8D 41 ?? 48 85 D2 48 0F 45 C1 66 89 30
            48 8D 95 ?? ?? ?? ?? 48 83 BD ?? ?? ?? ?? ?? 48 0F 43 95 ?? ?? ?? ?? 48 8D 44 24 ??
            48 89 44 24 ?? 41 B8 ?? ?? ?? ?? 48 8D 4C 24 ?? E8 ?? ?? ?? ?? 4C 8B 44 24 ?? BA ??
            ?? ?? ?? 48 8D 8D ?? ?? ?? ?? FF 15 ?? ?? ?? ?? 48 8D 44 24 ?? 48 8B 4C 24 ?? 48 3B
            C8 74 ?? FF 15 ?? ?? ?? ?? B9 ?? ?? ?? ?? 48 8D 85 ?? ?? ?? ?? 66 39 30 74 ?? 48 83
            C0 ?? 48 83 E9 ?? 75 ?? 48 85 C9 74 ?? B8 ?? ?? ?? ?? 48 2B C1 48 85 C9 48 0F 44 C6
            BA ?? ?? ?? ?? 48 2B D0 48 8D 8D ?? ?? ?? ?? 48 8D 0C 41 74 ?? 48 05 ?? ?? ?? ?? 48
            03 C2 4C 8D 0D ?? ?? ?? ?? 4C 2B C9 48 85 C0 74 ?? 45 0F B7 04 09 66 45 85 C0 74 ??
            66 44 89 01 48 83 C1 ?? 48 FF C8 48 83 EA ?? 75 ?? 48 8D 41 ?? 48 85 D2 48 0F 45 C1
            66 89 30 48 8D 95 ?? ?? ?? ?? 48 8D 8D ?? ?? ?? ?? FF 15 ?? ?? ?? ?? 4C 8B E0 48 89
            44 24 ?? 48 83 F8 ?? 75 ?? 48 8B 95 ?? ?? ?? ?? 48 83 FA ?? 72 ?? 48 FF C2 48 8B 8D
            ?? ?? ?? ?? 48 8B C1 48 81 FA ?? ?? ?? ?? 72 ?? 48 83 C2 ?? 48 8B 49 ?? 48 2B C1 48
            83 C0 ?? 48 83 F8 ?? 0F 87 ?? ?? ?? ?? E8 ?? ?? ?? ?? 33 C0
        }

        $encrypt_files_p1 = {
            B9 ?? ?? ?? ?? 48 8D 85 ?? ?? ?? ?? 90 66 83 38 ?? 74 ?? 48 83 C0 ?? 48 83 E9 ?? 75
            ?? 48 85 C9 74 ?? 41 B8 ?? ?? ?? ?? 48 8D 85 ?? ?? ?? ?? 4C 2B C1 BA ?? ?? ?? ?? 48
            85 C9 4C 0F 44 C3 4A 8D 04 40 49 2B D0 74 ?? 49 8D 88 ?? ?? ?? ?? 48 03 CA 4C 8D 0D
            ?? ?? ?? ?? 4C 2B C8 66 90 48 85 C9 74 ?? 45 0F B7 04 01 66 45 85 C0 74 ?? 66 44 89
            00 48 FF C9 48 83 C0 ?? 48 83 EA ?? 75 ?? 48 85 D2 48 8D 48 ?? 48 0F 45 C8 66 89 19
            48 89 5C 24 ?? 45 33 C9 C7 44 24 ?? ?? ?? ?? ?? 44 8B C7 8B D7 C7 44 24 ?? ?? ?? ??
            ?? 49 8B CC FF 15 ?? ?? ?? ?? 45 33 C9 48 89 5C 24 ?? C7 44 24 ?? ?? ?? ?? ?? 48 8D
            8D ?? ?? ?? ?? 44 8B C7 C7 44 24 ?? ?? ?? ?? ?? 48 8B F0 41 8D 51 ?? FF 15 ?? ?? ??
            ?? 41 B9 ?? ?? ?? ?? C7 44 24 ?? ?? ?? ?? ?? 4C 8D 05 ?? ?? ?? ?? 33 D2 48 8D 0D ??
            ?? ?? ?? 4C 8B F0 FF 15 ?? ?? ?? ?? FF 15 ?? ?? ?? ?? 3D ?? ?? ?? ?? 75 ?? 41 B9 ??
            ?? ?? ?? C7 44 24 ?? ?? ?? ?? ?? 4C 8D 05 ?? ?? ?? ?? 33 D2 48 8D 0D ?? ?? ?? ?? FF
            15 ?? ?? ?? ?? 48 8B 0D ?? ?? ?? ?? 48 8D 85 ?? ?? ?? ?? 45 33 C9 48 89 44 24 ?? 45
        }

        $encrypt_files_p2 = {
            33 C0 BA ?? ?? ?? ?? FF 15 ?? ?? ?? ?? 48 8B 0D ?? ?? ?? ?? FF 15 ?? ?? ?? ?? 48 8B
            15 ?? ?? ?? ?? 45 33 C9 48 8B 8D ?? ?? ?? ?? 44 8B C0 FF 15 ?? ?? ?? ?? 4C 8B 85 ??
            ?? ?? ?? 48 8D 85 ?? ?? ?? ?? 48 8B 0D ?? ?? ?? ?? 44 8B CF BA ?? ?? ?? ?? 48 89 44
            24 ?? FF 15 ?? ?? ?? ?? B9 ?? ?? ?? ?? FF 15 ?? ?? ?? ?? 32 DB 41 BD ?? ?? ?? ?? 48
            8B F8 66 66 66 0F 1F 84 00 ?? ?? 00 00 4C 8D 8D ?? ?? ?? ?? 48 C7 44 24 ?? ?? ?? ??
            ?? 41 B8 ?? ?? ?? ?? 48 8B D7 48 8B CE FF 15 ?? ?? ?? ?? 81 BD ?? ?? ?? ?? ?? ?? ??
            ?? 48 8D 85 ?? ?? ?? ?? 48 8B 8D ?? ?? ?? ?? C7 44 24 ?? ?? ?? ?? ?? 48 89 44 24 ??
            0F B6 DB 41 0F 42 DD 48 89 7C 24 ?? 44 0F B6 C3 45 33 C9 33 D2 FF 15 ?? ?? ?? ?? 44
            8B 85 ?? ?? ?? ?? 4C 8D 8D ?? ?? ?? ?? 48 8B D7 48 C7 44 24 ?? ?? ?? ?? ?? 49 8B CE
            FF 15 ?? ?? ?? ?? 84 DB 0F 84 ?? ?? ?? ?? 4C 8B 6C 24 ?? 48 85 F6 74 ?? 48 8B CE FF
            15 ?? ?? ?? ?? 4D 85 F6
        }

        $drop_ransom_note = {
            48 85 C9 74 ?? B8 ?? ?? ?? ?? 48 2B C1 48 85 C9 49 0F 44 C6 BA ?? ?? ?? ?? 48 2B D0
            48 8D 8D ?? ?? ?? ?? 48 8D 0C 41 74 ?? 48 05 ?? ?? ?? ?? 48 03 C2 4C 8D 0D ?? ?? ??
            ?? 4C 2B C9 66 90 48 85 C0 74 ?? 46 0F B7 04 09 66 45 85 C0 74 ?? 66 44 89 01 48 83
            C1 ?? 48 FF C8 48 83 EA ?? 75 ?? 48 8D 41 ?? 48 85 D2 48 0F 45 C1 66 44 89 30 4C 89
            74 24 ?? C7 44 24 ?? ?? ?? ?? ?? C7 44 24 ?? ?? ?? ?? ?? 45 33 C9 45 33 C0 BA ?? ??
            ?? ?? 48 8D 8D ?? ?? ?? ?? FF 15 ?? ?? ?? ?? 48 8B D8 49 C7 C0 ?? ?? ?? ?? 49 FF C0
            46 38 34 06 75 ?? 4C 89 74 24 ?? 4C 8D 8D ?? ?? ?? ?? 48 8B D6 48 8B CB FF 15 ?? ??
            ?? ?? 48 85 DB 74 ?? 48 8B CB FF 15 ?? ?? ?? ?? 48 8B CE E8 ?? ?? ?? ?? 90 48 8B 95
            ?? ?? ?? ?? 48 83 FA ?? 72 ?? 48 FF C2 48 8B 4D ?? 48 8B C1 48 81 FA ?? ?? ?? ?? 72
            ?? 48 83 C2 ?? 48 8B 49 ?? 48 2B C1 48 83 C0 ?? 48 83 F8 ?? 0F 87 ?? ?? ?? ?? E8 ??
            ?? ?? ?? 33 F6 48 89 B5 ?? ?? ?? ?? 48 C7 85 ?? ?? ?? ?? ?? ?? ?? ?? 40 88 75 ?? 48
            8B 95 ?? ?? ?? ?? 48 83 FA ?? 0F 82 ?? ?? ?? ?? 48 8D 14 55 ?? ?? ?? ?? 48 8B 8D ??
            ?? ?? ?? 48 8B C1 48 81 FA ?? ?? ?? ?? 0F 82 ?? ?? ?? ?? 48 83 C2 ?? 48 8B 49 ?? 48
            2B C1 48 83 C0 ?? 48 83 F8 ?? 0F 86 ?? ?? ?? ?? FF 15
        }

        $enum_drives = {
            48 89 5D ?? 48 C7 45 ?? ?? ?? ?? ?? C6 45 ?? ?? FF 15 ?? ?? ?? ?? 8B F8 0F A3 DF 0F
            83 ?? ?? ?? ?? 8D 4B ?? 48 C7 45 ?? ?? ?? ?? ?? 88 4D ?? 48 C7 45 ?? ?? ?? ?? ?? 66
            C7 45 ?? ?? ?? 48 8B 05 ?? ?? ?? ?? 48 3B 05 ?? ?? ?? ?? 74 ?? 48 8D 55 ?? 48 8B C8
            E8 ?? ?? ?? ?? 48 83 05 ?? ?? ?? ?? ?? EB ?? 4C 8D 45 ?? 48 8B D0 48 8D 0D ?? ?? ??
            ?? E8 ?? ?? ?? ?? 90 48 8B 45 ?? 48 83 F8 ?? 72 ?? 48 8D 50 ?? 48 8B 4D ?? 48 8B C1
            48 81 FA ?? ?? ?? ?? 72 ?? 48 83 C2 ?? 48 8B 49 ?? 48 2B C1 48 83 C0 ?? 48 83 F8 ??
            77 ?? E8 ?? ?? ?? ?? FF C3 83 FB ?? 0F 8C ?? ?? ?? ?? E8 ?? ?? ?? ?? 83 F8 ?? 75 ??
            E8 ?? ?? ?? ?? 90 33 C0 48 8B 4D ?? 48 33 CC E8 ?? ?? ?? ?? 4C 8D 5C 24 ?? 49 8B 5B
            ?? 49 8B 7B ?? 49 8B E3 5D C3 FF 15
        }

    condition:
        uint16(0) == 0x5A4D and
        (
            $enum_drives
        ) and
        (
            $find_files
        ) and
        (
            all of ($encrypt_files_p*)
        ) and
        (
            $drop_ransom_note
        )
}