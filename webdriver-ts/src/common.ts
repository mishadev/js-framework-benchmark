export interface JSONResult {
    framework: string, benchmark: string, type: string, min: number,
        max: number, mean: number, geometricMean: number,
        standardDeviation: number
}

export let config = {
    REPEAT_RUN: 10,
    DROP_WORST_RUN: 4,
    WARMUP_COUNT: 5,
    TIMEOUT: 60 * 1000,
    LOG_PROGRESS: true,
    LOG_DETAILS: false,
    LOG_DEBUG: false
}

export interface FrameworkData {
    name: string;
    uri: string;
    useShadowRoot: boolean;
}

function f(name: string, uri: string = null, useShadowRoot = false): FrameworkData {
    return {name, uri: uri ? uri : name, useShadowRoot};
}

export let frameworks = [
    f("inferno-v1.0.0-beta9"),
    f("knockout-v3.4.1"),
    f("mithril-v0.2.5"),
    f("mithril-v1.0.0-alpha"),
    f("nx-v1.0.0-alpha.4.0.0"),
    f("plastiq-v1.33.0"),
    f("preact-v6.4.0"),
    f("ractive-v0.8.5"),
    f("ractive-edge"),
    f("react-lite-v0.15.27"),
    f("react-v15.4.0"),
    f("react-v15.4.0-mobX-v2.6.3"),
    f("react-v15.4.0-redux-v3.6.0"),
    f("riot-v2.6.7"),
    f("simulacra-v1.5.5"),
    f("tsers-v1.0.0"),
    f("vanillajs"),
    f("vanillajs-keyed"),
    f("vidom-v0.5.3"),
    f("vue-v2.1.3")
];
