------------------------------ MODULE washlet ------------------------------
CONSTANTS READY \* 待機中
        , WASHING \* 洗浄中
        , MASSAGE \* マッサージ中

VARIABLES state \* 状態を表す変数

Init == state = READY \* 初期状態は待機中
Spec == Init \* システムの取りうる振る舞い

=============================================================================
\* Modification History
\* Last modified Wed Mar 27 13:26:41 JST 2019 by yuki.kokubun
\* Created Wed Mar 27 13:06:52 JST 2019 by yuki.kokubun
