enum ENUM_CANDLESTICK_PATTERN
{
    PATTERN_IS_NONE = 0,
    PATTERN_IS_DOJI = 1,
    PATTERN_IS_DOJIDRAGONFLY = 2,
    PATTERN_IS_DOJIGRAVESTONE = 3,
    PATTERN_IS_SPINNINGTOPBULLISH = 4,
    PATTERN_IS_SPINNINGTOPBEARISH = 5,
    PATTERN_IS_MARUBOZUUP = 6,
    PATTERN_IS_MARUBOZUDOWN = 7,
    PATTERN_IS_HAMMER = 8,
    PATTERN_IS_HANGINGMAN = 9,
    PATTERN_IS_INVERTEDHAMMER = 10,
    PATTERN_IS_SHOOTINGSTAR = 11,
    PATTERN_IS_BULLISHENGULFING = 12,
    PATTERN_IS_BEARISHENGULFING = 13,
    PATTERN_IS_TWEEZERTOP = 14,
    PATTERN_IS_TWEEZERBOTTOM = 15,
    PATTERN_IS_THREEWHITESOLDIERS = 16,
    PATTERN_IS_THREEBLACKCROWS = 17,
    PATTERN_IS_THREEINSIDEUP = 18,
    PATTERN_IS_THREEINSIDEDOWN = 19,
    PATTERN_IS_MORNINGSTAR = 20,
    PATTERN_IS_EVENINGSTAR = 21,
    PATTERN_IS_BULLISHHARAMI = 22,
    PATTERN_IS_BEARISHHARAMI = 23,
    PATTERN_IS_BULLISHTHREELINESTRIKE = 24,
    PATTERN_IS_BEARISHTHREELINESTRIKE = 25,
    PATTERN_IS_THREEOUTSIDEUP = 26,
    PATTERN_IS_THREEOUTSIDEDOWN = 27
};

bool IsDojiNeutral(string Instrument, ENUM_TIMEFRAMES Timeframe, int Shift = 0)
{
    double Shadow = iHigh(Instrument, Timeframe, Shift) - iLow(Instrument, Timeframe, Shift);
    double Body = MathAbs(iClose(Instrument, Timeframe, Shift) - iOpen(Instrument, Timeframe, Shift));
    if (Body < Shadow * 0.05 && !IsDojiGravestone(Instrument, Timeframe, Shift) && !IsDojyDragonfly(Instrument, Timeframe, Shift)) return true;
    else return false;
}

bool IsDojyDragonfly(string Instrument, ENUM_TIMEFRAMES Timeframe, int Shift = 0)
{
    double Shadow = iHigh(Instrument, Timeframe, Shift) - iLow(Instrument, Timeframe, Shift);
    double Body = MathAbs(iClose(Instrument, Timeframe, Shift) - iOpen(Instrument, Timeframe, Shift));
    if (Body < Shadow * 0.05 && iClose(Instrument, Timeframe, Shift) > iHigh(Instrument, Timeframe, Shift) - Shadow * 0.05) return true;
    else return false;
}

bool IsDojiGravestone(string Instrument, ENUM_TIMEFRAMES Timeframe, int Shift = 0)
{
    double Shadow = iHigh(Instrument, Timeframe, Shift) - iLow(Instrument, Timeframe, Shift);
    double Body = MathAbs(iClose(Instrument, Timeframe, Shift) - iOpen(Instrument, Timeframe, Shift));
    if (Body < Shadow * 0.05 && iClose(Instrument, Timeframe, Shift) < iLow(Instrument, Timeframe, Shift) + Shadow * 0.05) return true;
    else return false;
}

bool IsSpinningTopBullish(string Instrument, ENUM_TIMEFRAMES Timeframe, int Shift = 0)
{
    double Shadow = iHigh(Instrument, Timeframe, Shift) - iLow(Instrument, Timeframe, Shift);
    double Body = MathAbs(iClose(Instrument, Timeframe, Shift) - iOpen(Instrument, Timeframe, Shift));
    if (iOpen(Instrument, Timeframe, Shift) < iClose(Instrument, Timeframe, Shift) && iClose(Instrument, Timeframe, Shift) < iHigh(Instrument, Timeframe, Shift) - Shadow * 0.30 && iOpen(Instrument, Timeframe, Shift) > iLow(Instrument, Timeframe, Shift) + Shadow * 0.30 && Body < Shadow * 0.4 && Body > Shadow * 0.05) return true;
    else return false;
}

bool IsSpinningTopBearish(string Instrument, ENUM_TIMEFRAMES Timeframe, int Shift = 0)
{
    double Shadow = iHigh(Instrument, Timeframe, Shift) - iLow(Instrument, Timeframe, Shift);
    double Body = MathAbs(iClose(Instrument, Timeframe, Shift) - iOpen(Instrument, Timeframe, Shift));
    if (iOpen(Instrument, Timeframe, Shift) > iClose(Instrument, Timeframe, Shift) && iOpen(Instrument, Timeframe, Shift) < iHigh(Instrument, Timeframe, Shift) - Shadow * 0.30 && iClose(Instrument, Timeframe, Shift) > iLow(Instrument, Timeframe, Shift) + Shadow * 0.30 && Body < Shadow * 0.4 && Body > Shadow * 0.05) return true;
    else return false;
}

bool IsMarubozuUp(string Instrument, ENUM_TIMEFRAMES Timeframe, int Shift = 0)
{
    double Shadow = iHigh(Instrument, Timeframe, Shift) - iLow(Instrument, Timeframe, Shift);
    double Body = MathAbs(iClose(Instrument, Timeframe, Shift) - iOpen(Instrument, Timeframe, Shift));
    if (iOpen(Instrument, Timeframe, Shift) < iClose(Instrument, Timeframe, Shift) && iClose(Instrument, Timeframe, Shift) > iHigh(Instrument, Timeframe, Shift) - Shadow * 0.02 && iOpen(Instrument, Timeframe, Shift) < iLow(Instrument, Timeframe, Shift) + Shadow * 0.02 && Body > Shadow * 0.95) return true;
    else return false;
}

bool IsMarubozuDown(string Instrument, ENUM_TIMEFRAMES Timeframe, int Shift = 0)
{
    double Shadow = iHigh(Instrument, Timeframe, Shift) - iLow(Instrument, Timeframe, Shift);
    double Body = MathAbs(iClose(Instrument, Timeframe, Shift) - iOpen(Instrument, Timeframe, Shift));
    if (iOpen(Instrument, Timeframe, Shift) > iClose(Instrument, Timeframe, Shift) && iClose(Instrument, Timeframe, Shift) < iHigh(Instrument, Timeframe, Shift) + Shadow * 0.02 && iOpen(Instrument, Timeframe, Shift) > iLow(Instrument, Timeframe, Shift) - Shadow * 0.02 && Body > Shadow * 0.95) return true;
    else return false;
}

bool IsHammer(string Instrument, ENUM_TIMEFRAMES Timeframe, int Shift = 0)
{
    double Shadow = iHigh(Instrument, Timeframe, Shift) - iLow(Instrument, Timeframe, Shift);
    double Body = MathAbs(iClose(Instrument, Timeframe, Shift) - iOpen(Instrument, Timeframe, Shift));
    if (iOpen(Instrument, Timeframe, Shift) < iClose(Instrument, Timeframe, Shift) && iClose(Instrument, Timeframe, Shift) > iHigh(Instrument, Timeframe, Shift) - Shadow * 0.05 && Body < Shadow * 0.4 && Body > Shadow * 0.1) return true;
    else return false;
}

bool IsHangingMan(string Instrument, ENUM_TIMEFRAMES Timeframe, int Shift = 0)
{
    double Shadow = iHigh(Instrument, Timeframe, Shift) - iLow(Instrument, Timeframe, Shift);
    double Body = MathAbs(iClose(Instrument, Timeframe, Shift) - iOpen(Instrument, Timeframe, Shift));
    if (iOpen(Instrument, Timeframe, Shift) > iClose(Instrument, Timeframe, Shift) && iOpen(Instrument, Timeframe, Shift) > iHigh(Instrument, Timeframe, Shift) - Shadow * 0.05 && Body < Shadow * 0.4 && Body > Shadow * 0.1) return true;
    else return false;
}

bool IsInvertedHammer(string Instrument, ENUM_TIMEFRAMES Timeframe, int Shift = 0)
{
    double Shadow = iHigh(Instrument, Timeframe, Shift) - iLow(Instrument, Timeframe, Shift);
    double Body = MathAbs(iClose(Instrument, Timeframe, Shift) - iOpen(Instrument, Timeframe, Shift));
    if (iOpen(Instrument, Timeframe, Shift) < iClose(Instrument, Timeframe, Shift) && iOpen(Instrument, Timeframe, Shift) < iLow(Instrument, Timeframe, Shift) + Shadow * 0.05 && Body < Shadow * 0.4 && Body > Shadow * 0.1) return true;
    else return false;
}

bool IsShootingStar(string Instrument, ENUM_TIMEFRAMES Timeframe, int Shift = 0)
{
    double Shadow = iHigh(Instrument, Timeframe, Shift) - iLow(Instrument, Timeframe, Shift);
    double Body = MathAbs(iClose(Instrument, Timeframe, Shift) - iOpen(Instrument, Timeframe, Shift));
    if (iOpen(Instrument, Timeframe, Shift) > iClose(Instrument, Timeframe, Shift) && iClose(Instrument, Timeframe, Shift) < iLow(Instrument, Timeframe, Shift) + Shadow * 0.05 && Body < Shadow * 0.4 && Body > Shadow * 0.1) return true;
    else return false;
}

bool IsBullishEngulfing(string Instrument, ENUM_TIMEFRAMES Timeframe, int Shift = 0)
{
    int i = Shift;
    int j = i + 1;
    double ShadowPrev = iHigh(Instrument, Timeframe, j) - iLow(Instrument, Timeframe, j);
    double BodyCurr = MathAbs(iClose(Instrument, Timeframe, i) - iOpen(Instrument, Timeframe, i));
    if (IsDojiNeutral(Instrument, Timeframe, j)) return false;
    if (iClose(Instrument, Timeframe, j) < iOpen(Instrument, Timeframe, j) && iClose(Instrument, Timeframe, i) > iOpen(Instrument, Timeframe, i) && iClose(Instrument, Timeframe, i) > iHigh(Instrument, Timeframe, j) && BodyCurr > ShadowPrev) return true;
    else return false;
}

bool IsBearishEngulfing(string Instrument, ENUM_TIMEFRAMES Timeframe, int Shift = 0)
{
    int i = Shift;
    int j = i + 1;
    double ShadowPrev = iHigh(Instrument, Timeframe, j) - iLow(Instrument, Timeframe, j);
    double BodyCurr = MathAbs(iClose(Instrument, Timeframe, i) - iOpen(Instrument, Timeframe, i));
    if (IsDojiNeutral(Instrument, Timeframe, j)) return false;
    if (iClose(Instrument, Timeframe, j) > iOpen(Instrument, Timeframe, j) && iClose(Instrument, Timeframe, i) < iOpen(Instrument, Timeframe, i) && iClose(Instrument, Timeframe, i) < iLow(Instrument, Timeframe, j) && BodyCurr > ShadowPrev) return true;
    else return false;
}

bool IsTweezerTop(string Instrument, ENUM_TIMEFRAMES Timeframe, int Shift = 0)
{
    int i = Shift;
    int j = i + 1;
    double ShadowPrev = iHigh(Instrument, Timeframe, j) - iLow(Instrument, Timeframe, j);
    double BodyCurr = MathAbs(iClose(Instrument, Timeframe, i) - iOpen(Instrument, Timeframe, i));
    if (IsInvertedHammer(Instrument, Timeframe, j) && IsShootingStar(Instrument, Timeframe, i) &&
            ((iHigh(Instrument, Timeframe, j) < iHigh(Instrument, Timeframe, i) * 1.05 && iHigh(Instrument, Timeframe, j) > iHigh(Instrument, Timeframe, i) * 0.95) ||
             (iHigh(Instrument, Timeframe, i) < iHigh(Instrument, Timeframe, j) * 1.05 && iHigh(Instrument, Timeframe, i) > iHigh(Instrument, Timeframe, j) * 0.95)) &&
            ((iOpen(Instrument, Timeframe, j) < iClose(Instrument, Timeframe, i) * 1.05 && iOpen(Instrument, Timeframe, j) > iClose(Instrument, Timeframe, i) * 0.95) ||
             (iClose(Instrument, Timeframe, i) < iOpen(Instrument, Timeframe, j) * 1.05 && iClose(Instrument, Timeframe, i) > iOpen(Instrument, Timeframe, j) * 0.95))
      ) return true;
    else return false;
}

bool IsTweezerBottom(string Instrument, ENUM_TIMEFRAMES Timeframe, int Shift = 0)
{
    int i = Shift;
    int j = i + 1;
    double ShadowPrev = iHigh(Instrument, Timeframe, j) - iLow(Instrument, Timeframe, j);
    double BodyCurr = MathAbs(iClose(Instrument, Timeframe, i) - iOpen(Instrument, Timeframe, i));
    if (IsHangingMan(Instrument, Timeframe, j) && IsHammer(Instrument, Timeframe, i) &&
            ((iLow(Instrument, Timeframe, j) < iLow(Instrument, Timeframe, i) * 1.05 && iLow(Instrument, Timeframe, j) > iLow(Instrument, Timeframe, i) * 0.95) ||
             (iLow(Instrument, Timeframe, i) < iLow(Instrument, Timeframe, j) * 1.05 && iLow(Instrument, Timeframe, i) > iLow(Instrument, Timeframe, j) * 0.95)) &&
            ((iOpen(Instrument, Timeframe, j) < iClose(Instrument, Timeframe, i) * 1.05 && iOpen(Instrument, Timeframe, j) > iClose(Instrument, Timeframe, i) * 0.95) ||
             (iClose(Instrument, Timeframe, i) < iOpen(Instrument, Timeframe, j) * 1.05 && iClose(Instrument, Timeframe, i) > iOpen(Instrument, Timeframe, j) * 0.95))
      ) return true;
    else return false;
}

bool IsThreeWhiteSoldiers(string Instrument, ENUM_TIMEFRAMES Timeframe, int Shift = 0)
{
    int i = Shift;
    int j = i + 1;
    int k = j + 1;
    double ShadowI = iHigh(Instrument, Timeframe, i) - iLow(Instrument, Timeframe, i);
    double ShadowJ = iHigh(Instrument, Timeframe, j) - iLow(Instrument, Timeframe, j);
    double ShadowK = iHigh(Instrument, Timeframe, k) - iLow(Instrument, Timeframe, k);
    double BodyI = MathAbs(iClose(Instrument, Timeframe, i) - iOpen(Instrument, Timeframe, i));
    double BodyJ = MathAbs(iClose(Instrument, Timeframe, j) - iOpen(Instrument, Timeframe, j));
    double BodyK = MathAbs(iClose(Instrument, Timeframe, k) - iOpen(Instrument, Timeframe, k));
    if (iClose(Instrument, Timeframe, i) > iOpen(Instrument, Timeframe, i) && iClose(Instrument, Timeframe, j) > iOpen(Instrument, Timeframe, j) && iClose(Instrument, Timeframe, k) > iOpen(Instrument, Timeframe, k) && BodyI > ShadowI * 0.5 && BodyJ > ShadowJ * 0.5 && BodyK > ShadowK * 0.5 && BodyJ < BodyI && BodyK < BodyJ) return true;
    else return false;
}

bool IsThreeCrows(string Instrument, ENUM_TIMEFRAMES Timeframe, int Shift = 0)
{
    int i = Shift;
    int j = i + 1;
    int k = j + 1;
    double ShadowI = iHigh(Instrument, Timeframe, i) - iLow(Instrument, Timeframe, i);
    double ShadowJ = iHigh(Instrument, Timeframe, j) - iLow(Instrument, Timeframe, j);
    double ShadowK = iHigh(Instrument, Timeframe, k) - iLow(Instrument, Timeframe, k);
    double BodyI = MathAbs(iClose(Instrument, Timeframe, i) - iOpen(Instrument, Timeframe, i));
    double BodyJ = MathAbs(iClose(Instrument, Timeframe, j) - iOpen(Instrument, Timeframe, j));
    double BodyK = MathAbs(iClose(Instrument, Timeframe, k) - iOpen(Instrument, Timeframe, k));
    if (iClose(Instrument, Timeframe, i) < iOpen(Instrument, Timeframe, i) && iClose(Instrument, Timeframe, j) < iOpen(Instrument, Timeframe, j) && iClose(Instrument, Timeframe, k) < iOpen(Instrument, Timeframe, k) && BodyI > ShadowI * 0.5 && BodyJ > ShadowJ * 0.5 && BodyK > ShadowK * 0.5 && BodyJ < BodyI && BodyK < BodyJ) return true;
    else return false;
}

bool IsThreeInsideUp(string Instrument, ENUM_TIMEFRAMES Timeframe, int Shift = 0)
{
    int i = Shift;
    int j = i + 1;
    int k = j + 1;
    double ShadowI = iHigh(Instrument, Timeframe, i) - iLow(Instrument, Timeframe, i);
    double ShadowJ = iHigh(Instrument, Timeframe, j) - iLow(Instrument, Timeframe, j);
    double ShadowK = iHigh(Instrument, Timeframe, k) - iLow(Instrument, Timeframe, k);
    double BodyI = MathAbs(iClose(Instrument, Timeframe, i) - iOpen(Instrument, Timeframe, i));
    double BodyJ = MathAbs(iClose(Instrument, Timeframe, j) - iOpen(Instrument, Timeframe, j));
    double BodyK = MathAbs(iClose(Instrument, Timeframe, k) - iOpen(Instrument, Timeframe, k));
    if (iClose(Instrument, Timeframe, i) > iOpen(Instrument, Timeframe, i) && iClose(Instrument, Timeframe, j) > iOpen(Instrument, Timeframe, j) && iClose(Instrument, Timeframe, k) < iOpen(Instrument, Timeframe, k) &&
            iClose(Instrument, Timeframe, j) < iOpen(Instrument, Timeframe, k) && iClose(Instrument, Timeframe, j) > iClose(Instrument, Timeframe, k) + BodyK / 4 && iClose(Instrument, Timeframe, i) > iHigh(Instrument, Timeframe, k) &&
            BodyI > ShadowI / 2 && BodyJ > ShadowJ / 2 && BodyK > ShadowK / 2) return true;
    else return false;
}

bool IsThreeInsideDown(string Instrument, ENUM_TIMEFRAMES Timeframe, int Shift = 0)
{
    int i = Shift;
    int j = i + 1;
    int k = j + 1;
    double ShadowI = iHigh(Instrument, Timeframe, i) - iLow(Instrument, Timeframe, i);
    double ShadowJ = iHigh(Instrument, Timeframe, j) - iLow(Instrument, Timeframe, j);
    double ShadowK = iHigh(Instrument, Timeframe, k) - iLow(Instrument, Timeframe, k);
    double BodyI = MathAbs(iClose(Instrument, Timeframe, i) - iOpen(Instrument, Timeframe, i));
    double BodyJ = MathAbs(iClose(Instrument, Timeframe, j) - iOpen(Instrument, Timeframe, j));
    double BodyK = MathAbs(iClose(Instrument, Timeframe, k) - iOpen(Instrument, Timeframe, k));
    if (iClose(Instrument, Timeframe, i) < iOpen(Instrument, Timeframe, i) && iClose(Instrument, Timeframe, j) < iOpen(Instrument, Timeframe, j) && iClose(Instrument, Timeframe, k) > iOpen(Instrument, Timeframe, k) &&
        iClose(Instrument, Timeframe, j) > iOpen(Instrument, Timeframe, k) && iClose(Instrument, Timeframe, j) < iClose(Instrument, Timeframe, k) - BodyK / 4 && iClose(Instrument, Timeframe, i) < iLow(Instrument, Timeframe, k) &&
            BodyI > ShadowI / 2 && BodyJ > ShadowJ / 2 && BodyK > ShadowK / 2) return true;
    else return false;
}

bool IsMorningStar(string Instrument, ENUM_TIMEFRAMES Timeframe, int Shift = 0)
{
    int i = Shift;
    int j = i + 1;
    int k = j + 1;
    double ShadowI = iHigh(Instrument, Timeframe, i) - iLow(Instrument, Timeframe, i);
    double ShadowJ = iHigh(Instrument, Timeframe, j) - iLow(Instrument, Timeframe, j);
    double ShadowK = iHigh(Instrument, Timeframe, k) - iLow(Instrument, Timeframe, k);
    double BodyI = MathAbs(iClose(Instrument, Timeframe, i) - iOpen(Instrument, Timeframe, i));
    double BodyJ = MathAbs(iClose(Instrument, Timeframe, j) - iOpen(Instrument, Timeframe, j));
    double BodyK = MathAbs(iClose(Instrument, Timeframe, k) - iOpen(Instrument, Timeframe, k));
    if (iClose(Instrument, Timeframe, i) > iOpen(Instrument, Timeframe, i) && iClose(Instrument, Timeframe, k) < iOpen(Instrument, Timeframe, k) && iClose(Instrument, Timeframe, i) > iOpen(Instrument, Timeframe, k) - BodyK / 2 &&
            (IsDojiNeutral(Instrument, Timeframe, j) || IsSpinningTopBullish(Instrument, Timeframe, j)) && !IsDojiNeutral(Instrument, Timeframe, k)) return true;
    else return false;
}

bool IsEveningStar(string Instrument, ENUM_TIMEFRAMES Timeframe, int Shift = 0)
{
    int i = Shift;
    int j = i + 1;
    int k = j + 1;
    double ShadowI = iHigh(Instrument, Timeframe, i) - iLow(Instrument, Timeframe, i);
    double ShadowJ = iHigh(Instrument, Timeframe, j) - iLow(Instrument, Timeframe, j);
    double ShadowK = iHigh(Instrument, Timeframe, k) - iLow(Instrument, Timeframe, k);
    double BodyI = MathAbs(iClose(Instrument, Timeframe, i) - iOpen(Instrument, Timeframe, i));
    double BodyJ = MathAbs(iClose(Instrument, Timeframe, j) - iOpen(Instrument, Timeframe, j));
    double BodyK = MathAbs(iClose(Instrument, Timeframe, k) - iOpen(Instrument, Timeframe, k));
    if (iClose(Instrument, Timeframe, i) < iOpen(Instrument, Timeframe, i) && iClose(Instrument, Timeframe, k) > iOpen(Instrument, Timeframe, k) && iClose(Instrument, Timeframe, i) < iOpen(Instrument, Timeframe, k) + BodyK / 2 &&
            (IsDojiNeutral(Instrument, Timeframe, j) || IsSpinningTopBearish(Instrument, Timeframe, j)) && !IsDojiNeutral(Instrument, Timeframe, k)) return true;
    else return false;
}

bool IsBullishHarami(string Instrument, ENUM_TIMEFRAMES Timeframe, int Shift = 0)
{
    if (Shift > iBars(Instrument, Timeframe) - 5) return false; // A 5-bar pattern.
    
    int i = Shift;
    int j = i + 1;
    int k = j + 1;
    int l = k + 1;
    int m = l + 1;
    
    double MiddleK = (iClose(Instrument, Timeframe, k) + iOpen(Instrument, Timeframe, k)) / 2;
    double MiddleL = (iClose(Instrument, Timeframe, l) + iOpen(Instrument, Timeframe, l)) / 2;
    double MiddleM = (iClose(Instrument, Timeframe, m) + iOpen(Instrument, Timeframe, m)) / 2;
    if ((MiddleK >= MiddleL) || (MiddleL >= MiddleM)) return false; // Not a downtrend.

    if (iClose(Instrument, Timeframe, j) >= iOpen(Instrument, Timeframe, j)) return false; // j - Not a bearish candle.
    if (iClose(Instrument, Timeframe, i) <= iOpen(Instrument, Timeframe, i)) return false; // i - Not a bullish candle.
    
    double BodyJ = MathAbs(iClose(Instrument, Timeframe, j) - iOpen(Instrument, Timeframe, j));
    double BodyK = MathAbs(iClose(Instrument, Timeframe, k) - iOpen(Instrument, Timeframe, k));
    double BodyL = MathAbs(iClose(Instrument, Timeframe, l) - iOpen(Instrument, Timeframe, l));
    double BodyM = MathAbs(iClose(Instrument, Timeframe, m) - iOpen(Instrument, Timeframe, m));

    if (BodyJ >= 2 * (BodyK + BodyL + BodyM) / 3) // Long body.
    {
        // The bullish candle should be fully contained inside the bearish candle with only either top or bottom being the same (not both).
        if (((iOpen(Instrument, Timeframe, i) >= iClose(Instrument, Timeframe, j)) && (iClose(Instrument, Timeframe, i) < iOpen(Instrument, Timeframe, j))) || ((iOpen(Instrument, Timeframe, i) > iClose(Instrument, Timeframe, j)) && (iClose(Instrument, Timeframe, i) <= iOpen(Instrument, Timeframe, j)))) return true;
    }

    return false;
}

bool IsBearishHarami(string Instrument, ENUM_TIMEFRAMES Timeframe, int Shift = 0)
{
    if (Shift > iBars(Instrument, Timeframe) - 5) return false; // A 5-bar pattern.
    
    int i = Shift;
    int j = i + 1;
    int k = j + 1;
    int l = k + 1;
    int m = l + 1;

    double MiddleK = (iClose(Instrument, Timeframe, k) + iOpen(Instrument, Timeframe, k)) / 2;
    double MiddleL = (iClose(Instrument, Timeframe, l) + iOpen(Instrument, Timeframe, l)) / 2;
    double MiddleM = (iClose(Instrument, Timeframe, m) + iOpen(Instrument, Timeframe, m)) / 2;
    if ((MiddleK <= MiddleL) || (MiddleL <= MiddleM)) return false; // Not an uptrend.

    if (iClose(Instrument, Timeframe, j) <= iOpen(Instrument, Timeframe, j)) return false; // j - Not a bullish candle.
    if (iClose(Instrument, Timeframe, i) >= iOpen(Instrument, Timeframe, i)) return false; // i - Not a bearish candle.
    
    double BodyJ = MathAbs(iClose(Instrument, Timeframe, j) - iOpen(Instrument, Timeframe, j));
    double BodyK = MathAbs(iClose(Instrument, Timeframe, k) - iOpen(Instrument, Timeframe, k));
    double BodyL = MathAbs(iClose(Instrument, Timeframe, l) - iOpen(Instrument, Timeframe, l));
    double BodyM = MathAbs(iClose(Instrument, Timeframe, m) - iOpen(Instrument, Timeframe, m));

    if (BodyJ >= 2 * (BodyK + BodyL + BodyM) / 3) // Long body.
    {
        // The bearish candle should be fully contained inside the bullish candle with only either top or bottom being the same (not both).
        if (((iOpen(Instrument, Timeframe, i) <= iClose(Instrument, Timeframe, j)) && (iClose(Instrument, Timeframe, i) > iOpen(Instrument, Timeframe, j))) || ((iOpen(Instrument, Timeframe, i) < iClose(Instrument, Timeframe, j)) && (iClose(Instrument, Timeframe, i) >= iOpen(Instrument, Timeframe, j)))) return true;
    }

    return false;
}

bool IsBullishThreeLineStrike(string Instrument, ENUM_TIMEFRAMES Timeframe, int Shift = 0)
{
    if (Shift > iBars(Instrument, Timeframe) - 4) return false; // A 4-bar pattern.
    
    int i = Shift;
    int j = i + 1;
    int k = j + 1;
    int l = k + 1;

    // Three bars not bullish:
    if (iClose(Instrument, Timeframe, j) <= iOpen(Instrument, Timeframe, j)) return false;
    if (iClose(Instrument, Timeframe, k) <= iOpen(Instrument, Timeframe, k)) return false;
    if (iClose(Instrument, Timeframe, l) <= iOpen(Instrument, Timeframe, l)) return false;
    
    if ((iClose(Instrument, Timeframe, j) <= iClose(Instrument, Timeframe, k)) || (iClose(Instrument, Timeframe, k) <= iClose(Instrument, Timeframe, l))) return false; // Not consecutively closing higher.
    
    // Covers completely preceding candle.
    if ((iOpen(Instrument, Timeframe, i) > iClose(Instrument, Timeframe, j)) && (iClose(Instrument, Timeframe, i) < iOpen(Instrument, Timeframe, j))) return true;

    return false;
}

bool IsBearishThreeLineStrike(string Instrument, ENUM_TIMEFRAMES Timeframe, int Shift = 0)
{
    if (Shift > iBars(Instrument, Timeframe) - 4) return false; // A 4-bar pattern.
    
    int i = Shift;
    int j = i + 1;
    int k = j + 1;
    int l = k + 1;

    // Three bars not bearish:
    if (iClose(Instrument, Timeframe, j) >= iOpen(Instrument, Timeframe, j)) return false;
    if (iClose(Instrument, Timeframe, k) >= iOpen(Instrument, Timeframe, k)) return false;
    if (iClose(Instrument, Timeframe, l) >= iOpen(Instrument, Timeframe, l)) return false;
    
    if ((iClose(Instrument, Timeframe, j) >= iClose(Instrument, Timeframe, k)) || (iClose(Instrument, Timeframe, k) >= iClose(Instrument, Timeframe, l))) return false; // Not consecutively closing lower.
    
    // Covers completely preceding candle.
    if ((iOpen(Instrument, Timeframe, i) < iClose(Instrument, Timeframe, j)) && (iClose(Instrument, Timeframe, i) > iOpen(Instrument, Timeframe, j))) return true;

    return false;
}

bool IsThreeOutsideUp(string Instrument, ENUM_TIMEFRAMES Timeframe, int Shift = 0)
{
    int i = Shift;
    int j = i + 1;
    int k = j + 1;

    if (!IsBullishEngulfing(Instrument, Timeframe, j)) return false; // Requires a bullish Engulfing.

    // Exceeded previous candle's close:
    if (iClose(Instrument, Timeframe, i) > iClose(Instrument, Timeframe, j)) return true;

    return false;
}

bool IsThreeOutsideDown(string Instrument, ENUM_TIMEFRAMES Timeframe, int Shift = 0)
{
    int i = Shift;
    int j = i + 1;
    int k = j + 1;

    if (!IsBearishEngulfing(Instrument, Timeframe, j)) return false; // Requires a bearish Engulfing.

    // Exceeded previous candle's close:
    if (iClose(Instrument, Timeframe, i) < iClose(Instrument, Timeframe, j)) return true;

    return false;
}
//+------------------------------------------------------------------+